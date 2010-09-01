require 'test_helper'

class AllCreateTest < ActionController::IntegrationTest
  
  def setup

  end

  def test_create


    #
    # new publisher
    #
    old_publishers = Publishers.all

    get '/publishers/new'
    assert_response :success

    post '/publishers', :publishers => { :name => "integration verlag", :city => 'dresden'}
    assert_redirected_to '/publishers/new'
    new_publishers = Publishers.all
    assert_equal new_publishers.size, (old_publishers.size + 1 )

    #
    # new author
    #
    get 'authors/new'
    assert_response :success

    old_authors = Authors.all
    post 'authors' , :authors => { :firstname => "hans", :lastname => "peter" }
    assert_redirected_to '/authors/new'
    new_authors = Authors.all

    assert_equal new_authors.size, (old_authors.size + 1)

    #
    # new book
    #
  
    author = Authors.find(:first,  :conditions => {:lastname => "peter"}) 
    publisher = Publishers.find( :first, :conditions => { :name => "integration verlag"})
    genre = Genres.find :first
    type = Types.find :first


    books_old = Books.find :all
    get '/books/new'
    assert_response :success 
    post '/books',  :books => { :title => "Integrationtesting für Dummies", :publisher => publisher.id.to_s, :order_no => "1" },
                    :authors => { :id => author.id },
                    :genres => { :id => genre.id },
                    :types => { :id => type.id }
    assert_response :redirect
    assert_redirected_to '/books/new'
    books_new = Books.find :all
    assert_equal books_new.size, (books_old.size+1)
    book = Books.find (:first, :conditions => { :order_no => "1" }) 
    assert_equal book.publishers, publisher
    assert_equal book.authors.first, author
    assert_equal book.genres.first , genre
    assert_equal book.types.first , type
  end
end

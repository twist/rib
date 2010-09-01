

require 'test_helper'
require 'mocha'

class BookTest < ActionController::IntegrationTest

  def test_search_by_isbn

    get '/books/search_by_isbn'
    assert_response :success

    post '/books/new_by_isbn', :books => {:isbn10 => "1595404325"}
    assert_response :success
    assert_match 'selected="selected">Orwell, George</option></select>', @response.body, @response.body

    

    

  end

  def test_search_by_isbn_not_found

    get '/books/search_by_isbn'
    assert_response :success

    post '/books/new_by_isbn', :books => {:isbn10 => "978337801092"}
    assert_response :redirect

  end
end

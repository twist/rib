class BooksController < BaseController

  layout 'std'
  def index
    @books = Books.all
  end

  def new

    @book = Books.new
    @publishers = Publishers.find(:all, :order => 'name')
    @authors_list = Authors.select_list
    @genres_list = Genres.select_list
    @types_list = Types.select_list
  end

  def search_by_isbn
    @book = Books.new

  end

  def new_by_isbn

    @book = Books.new params[:books]
    @book = Books.new params[:books]
    @client = WClient.new
    @client.access_key = NotInRepo.access_key
    @book_hash = @client.search_by_isbn(@book.isbn10)
    if @book_hash[:title].nil? 
      redirect_to :action => :new 
      return
    end
    unless @book_hash[:publisher].nil?
      @publisher = Publishers.find_by_name(@book_hash[:publisher])
      if @publisher.nil?
        @publisher = Publishers.new
        @publisher.name = @book_hash[:publisher]
        @publisher.city = "NULL" 
        @publisher.save!
      end
      @book_hash[:publisher] = @publisher.id
    else
      @publisher = Publishers.new
    end


    firstname = @book_hash[:author].split(/ /).first 
    lastname = @book_hash[:author].split(/ /).last 
    @author = Authors.find(:first, :conditions => {:firstname => firstname, :lastname => lastname})
    if @author.nil?
      @author = Authors.new
      @author.firstname = firstname 
      @author.lastname = lastname 
      @author.save!
    end
    @book_hash[:author] = @author.id



    @publishers = Publishers.find(:all, :order => 'name')
    @authors_list = Authors.select_list
    @genres_list = Genres.select_list
    @types_list = Types.select_list
    @book.from_hash(@book_hash)

    render :new


  end

  def edit
    @book = Books.find params[:id]
    @publishers = Publishers.find(:all, :order => 'name')
    @authors_list = Authors.select_list
    @genres_list = Genres.select_list
    @types_list = Types.select_list
  end

  def show
    @book = Books.find(params[:id])

  end

  def update
  end

  def create
    @book = Books.new params[:books]
    @book.authors <<(Authors.find params[:authors][:id])
    @book.genres <<(Genres.find params[:genres][:id])
    @book.types <<(Types.find params[:types][:id])
    if @book.valid?
      @book.save!
      redirect_to :action => :new
    else
      @publishers = Publishers.find(:all, :order => 'name')
      @authors = Authors.find(:all, :order => 'nachname')
      @authors_list = Authors.select_list
      @genres_list = Genres.select_list
      render :new
    end

  end

end

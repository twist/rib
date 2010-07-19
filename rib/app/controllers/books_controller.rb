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

	def edit
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

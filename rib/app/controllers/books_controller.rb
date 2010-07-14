class BooksController < BaseController

	layout 'std'
	def index
		@books = Books.all
	end

	def new

		@book = Books.new
		@publishers = Publishers.find (:all, :order => 'name')
		@authors_list = Authors.select_list
	end

	def edit
	end

	def update
	end

	def create
		@book = Books.new params[:books]
		@book.authors << (Authors.find params[:authors][:id])
		if @book.valid?
			@book.save!
		redirect_to :action => :index
		else
			@publishers = Publishers.find (:all, :order => 'name')
			@authors = Authors.find (:all, :order => 'nachname')
			render :new
		end
			
	end

end

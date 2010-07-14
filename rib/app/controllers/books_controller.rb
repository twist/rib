class BooksController < BaseController

	layout 'std'
	def index
		@books = Books.all
	end

	def new

		@book = Books.new
		@publishers = Publishers.find (:all, :order => 'name')
	end

	def edit
	end

	def update
	end

	def create
		@book = Books.new params[:books]
		if @book.valid?
			@book.save!
		end
		redirect_to :action => :index
	end

end

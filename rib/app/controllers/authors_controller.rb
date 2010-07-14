class AuthorsController < BaseController


	def index
		@authors = Authors.all
	end

	def new

		@author = Authors.new
	end

	def edit
	end

	def update
	end

	def create
		@author = Authors.new params[:books]
		if @author.valid?
			@author.save!
		end
		redirect_to :action => :index
	end
end

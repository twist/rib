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

	end
end

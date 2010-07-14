class PublishersController < BaseController


	def index
	end

	def new
		@publisher = Publishers.new
	end

	def create 
		@publisher = Publishers.new params[:books]
		if @publisher.valid?
			@publisher.save!
		end
		redirect_to :index
	end

	def update

	end

	def edit
	end
end

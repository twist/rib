class PortalController < BaseController

	def index

		@books = Books.find (:all, :order => "titel" )
		@authors = Authors.find (:all, :order => "nachname" )
		@publishers = Publishers.find (:all, :order => "name" )
	end
end

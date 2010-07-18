class PortalController < BaseController

	def index

		@books = Books.find (:all, :order => "titel" )
    @page_count = 0
    @books.each do |b|
      @page_count += b.seiten.to_i
    end
		@authors = Authors.find (:all, :order => "nachname" )
		@publishers = Publishers.find (:all, :order => "name" )
	end
end

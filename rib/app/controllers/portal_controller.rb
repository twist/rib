class PortalController < BaseController

	def index

		@books = Books.find(:all, :order => "title" )
    @page_count = 0
    @books.each do |b|
      @page_count += b.pages.to_i
    end
		@authors = Authors.find(:all, :order => "lastname" )
		@publishers = Publishers.find(:all, :order => "name" )
	end

  def paged
    index
    params[:id] = 'A' if params[:id].nil?
    @books_paged = []
    @books.each do |b|
      @books_paged << b if b.titel =~ /^#{params[:id]}.*/i
    end
  end
end

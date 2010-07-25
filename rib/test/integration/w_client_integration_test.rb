
require 'test_helper'
require 'mocha'

class WebOfBooksClientIntegration_test < ActionController::IntegrationTest


  def setup

  end
  def test_client_to_object

    client = WClient.new
    client.access_key = NotInRepo.access_key
    book = Books.new

    book = client.search_by_isbn("9780595197798", book)
  end


  def test_not_found_on_isbndb
    client = WClient.new
    client.access_key = NotInRepo.access_key
    book = Books.new

    book = client.search_by_isbn("978337801925", book)
    assert book[:title].blank?

  end

  def test_open_library
    client = WClient.new
    client.access_key = NotInRepo.access_key
    book = Books.new

    book = client.search_by_isbn("9780595197798", book)
  end

end

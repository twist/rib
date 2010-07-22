
require 'test_helper'
require 'mocha'

class WebOfBooksClientIntegration_test < ActionController::IntegrationTest


  def setup

  end
  def test_client_to_object

    client = WClient.new
    pp NotInRepo.data
    client.access_key = NotInRepo.data
    book = Books.new

    book = client.search_by_isbn("9780595197798", book)
    puts book.inspect
  end

end

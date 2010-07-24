
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

  def test_search_amazon


    client = WClient.new
    client.search_by_isbn("3746615143")
  end

end

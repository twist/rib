
require 'test_helper'

class GbClientIntegration_test < ActionController::IntegrationTest

  def test_client_to_object

    client = GbClient.new
    book = Books.new

    book = client.search_by_isbn("978-3-936937-73-2", book)
    puts book.inspect
  end
end

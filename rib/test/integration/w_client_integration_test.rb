
require 'test_helper'
require 'mocha'

class WebOfBooksClientIntegration_test < ActionController::IntegrationTest


  def setup

    WClient.any_instance.stubs(:access_key).returns(get_ak)
  end
  def test_client_to_object

    client = WClient.new
    book = Books.new

    book = client.search_by_isbn("9780595197798", book)
    puts book.inspect
  end

  def get_ak

    return File.new("/home/twist/ak","r").gets.gsub(/\W/,"")

  end
end

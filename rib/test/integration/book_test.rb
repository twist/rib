

require 'test_helper'
require 'mocha'

class BookTest < ActionController::IntegrationTest

  def test_search_by_isbn

    get '/books/search_by_isbn'
    assert_response :success

  end

end

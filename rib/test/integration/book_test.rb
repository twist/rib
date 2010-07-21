

require 'test_helper'
require 'mocha'

class BookTest < ActionController::IntegrationTest

  def test_search_by_isbn

    get '/books/search_by_isbn'
    assert_response :success

    post '/books/new_by_isbn', :books => {:isbn => "1595404325"}
    assert_response :success

    

  end

end

require 'test_helper'

class AllCreateTest < ActionController::IntegrationTest
  
  def setup

  end

  def test_create

    get '/publishers/new'
    assert_response :success

  end
end

require 'test_helper'

class WClientTest < ActiveSupport::TestCase

  def test_search_by_isbn

    client = WClient.new
    data =client.search_by_isbn("978-3-936937-73-2")
    
  end
end

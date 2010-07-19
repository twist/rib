require 'test_helper'

class GbClientTest < ActiveSupport::TestCase

  def test_search_by_isbn

    client = GbClient.new
    client.search_by_isbn("asdas")
  end
end

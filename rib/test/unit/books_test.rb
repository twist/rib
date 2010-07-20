require 'test_helper'

class BooksTest < ActiveSupport::TestCase

  def test_from_hash

    hash = { :title => "hashes for beeginner", :isbn => "1234", :number => "1" }

    b = Books.new
    b.from_hash(hash)

    assert_equal b.title, hash[:title]
  end
end

require 'test_helper'

class ModelRelationshipsTest < ActiveSupport::TestCase
  

	def test_books_publishers

		b = Books.first
		assert_equal  1, b.publishers.id
	end
 
	def test_author_books

		b = Books.first
	end


end

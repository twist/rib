require 'test_helper'

class ModelRelationshipsTest < ActiveSupport::TestCase
  

	def test_books_publishers

		b = Books.first
		assert_equal  1, b.publishers.id
	end
 
	def test_author_books

		b = Books.first
		a = Authors.first
		assert b.authors.blank?

		b.authors << a
		assert_equal "hans", b.authors.first.firstname

		b.save!

		b2 = Books.first
		assert_equal "hans", b2.authors.first.firstname


		a2 = Authors.first
		assert a2.books.any?
	end


end

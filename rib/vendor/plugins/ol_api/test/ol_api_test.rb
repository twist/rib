require 'test_helper'

class OlApiTest < ActiveSupport::TestCase
  # Replace this with your real tests.

	def setup
		file = File.open("~/ol_data", "r")
		file.each_line { |l|
			puts l.inspect
		}

	end	


	def test_get_book

	end


end

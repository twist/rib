class Author < ActiveRecord::Base
	has_many :book
	set_table_name :autoren
end

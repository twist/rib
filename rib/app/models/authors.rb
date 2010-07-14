class Authors < ActiveRecord::Base
	has_many :books
	set_table_name :autoren
end

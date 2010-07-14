class Publishers < ActiveRecord::Base
  	has_many    :books,  
                                   :foreign_key => 'verlag'
	set_table_name :verlage
end

class Publisher < ActiveRecord::Base
  	has_many    :book,  
                                   :foreign_key => 'verlag'
	set_table_name :verlage
end

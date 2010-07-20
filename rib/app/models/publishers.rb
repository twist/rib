class Publishers < ActiveRecord::Base
  	has_many    :books,  
                                   :foreign_key => 'publisher'
end

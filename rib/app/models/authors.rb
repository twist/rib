class Authors < ActiveRecord::Base
  	has_and_belongs_to_many :books, :join_table => 'autoren_buecher', 
                                   :foreign_key => 'autor_id', 
                                   :class_name => 'Books', 
				   :association_foreign_key => 'buch_id'
	set_table_name :autoren
end

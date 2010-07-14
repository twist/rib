class Book < ActiveRecord::Base
  has_and_belongs_to_many :author, :join_table => 'autoren_buecher', 
                                   :foreign_key => 'buch_id', 
				   :association_foreign_key => 'autor_id'
  belongs_to		  :publisher, :foreign_key => 'verlag'
  set_table_name :buecher
end

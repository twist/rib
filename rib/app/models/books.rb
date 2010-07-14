class Books < ActiveRecord::Base
  has_and_belongs_to_many :authors, :join_table => 'autoren_buecher', 
                                   :foreign_key => 'buch_id', 
				   :association_foreign_key => 'autor_id'
  belongs_to		  :publishers, :foreign_key => 'verlag'
  set_table_name :buecher
end

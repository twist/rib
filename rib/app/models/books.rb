class Books < ActiveRecord::Base
  has_and_belongs_to_many :authors, :join_table => 'autoren_buecher', 
                                   :foreign_key => 'buch_id', 
                                   :class_name => 'Authors', 
				   :association_foreign_key => 'autor_id'

  has_and_belongs_to_many :genres, :join_table => 'buecher_genres', 
                                   :foreign_key => 'buch_id', 
                                   :class_name => 'Genres', 
				   :association_foreign_key => 'genre_id'
  has_and_belongs_to_many :types, :join_table => 'buecher_rubrik', 
                                   :foreign_key => 'buch_id', 
                                   :class_name => 'Types', 
				   :association_foreign_key => 'rubrik_id'
  belongs_to		  :publishers, :foreign_key => 'verlag'

  has_many                :checkouts, :foreign_key => 'buch_id'
  set_table_name :buecher
end

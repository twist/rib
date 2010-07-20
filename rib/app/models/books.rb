class Books < ActiveRecord::Base
  has_and_belongs_to_many :authors, :join_table => 'authors_books', 
                                   :foreign_key => 'book_id', 
                                   :class_name => 'Authors', 
				   :association_foreign_key => 'author_id'

  has_and_belongs_to_many :genres, :join_table => 'books_genres', 
                                   :foreign_key => 'book_id', 
                                   :class_name => 'Genres', 
				   :association_foreign_key => 'genre_id'
  has_and_belongs_to_many :types, :join_table => 'books_types', 
                                   :foreign_key => 'book_id', 
                                   :class_name => 'Types', 
				   :association_foreign_key => 'type_id'
  belongs_to		  :publishers, :foreign_key => 'publisher'

  has_many                :checkouts, :foreign_key => 'book_id'
end

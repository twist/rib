class Genres < ActiveRecord::Base
  has_and_belongs_to_many :books, :join_table => 'books_genres', 
                                   :foreign_key => 'genre_id', 
                                   :class_name => 'Books', 
	                                 :association_foreign_key => 'book_id'

  set_table_name 'genres'

	def self.select_list
		auth = Genres.find(:all, :order => 'name')
		select_list = []
		auth.each  { |g|
			select_list << ["#{g.name}", g.id]
		}
		select_list
	end
end

class Types < ActiveRecord::Base
  has_and_belongs_to_many :books, :join_table => 'books_types', 
                                   :foreign_key => 'type_id', 
                                   :class_name => 'Books', 
	                           :association_foreign_key => 'book_id'

  def self.select_list
          auth = Types.find(:all, :order => 'name')
          select_list = []
          auth.each  { |g|
                  select_list << ["#{g.name}", g.id]
          }
          select_list
  end
end

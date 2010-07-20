class Authors < ActiveRecord::Base
  	has_and_belongs_to_many :books, :join_table => 'authors_books', 
                                   :foreign_key => 'author_id', 
                                   :class_name => 'Books', 
				   :association_foreign_key => 'book_id'

	def self.select_list
		auth = Authors.find(:all, :order => 'lastname')
		select_list = []
		auth.each  { |a|
			select_list << ["#{a.lastname}, #{a.firstname}", a.id]
		}
		select_list
	end
end

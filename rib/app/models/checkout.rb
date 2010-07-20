class Checkouts < ActiveRecord::Base
  belongs_to :books, :foreign_key => 'book_id'
  belongs_to :contacts, :foreign_key => 'contact_id'
end

class Checkouts < ActiveRecord::Base
  belongs_to :books, :foreign_key => 'buch_id'
  belongs_to :contacts, :foreign_key => 'kontakt_id'
  set_table_name :ausleihe
end

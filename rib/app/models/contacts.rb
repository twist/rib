class Contacts < ActiveRecord::Base
  has_many	:checkouts
  set_table_name :kontakte
end

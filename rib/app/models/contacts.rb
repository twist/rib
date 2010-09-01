class Contacts < ActiveRecord::Base
  has_many	:checkouts
end

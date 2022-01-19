class Post < ApplicationRecord
  belongs_to :customer
  has_one :response

end

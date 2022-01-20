class Post < ApplicationRecord
  belongs_to :customer
  has_one :response

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
  validates :customer_id, presence: true

end

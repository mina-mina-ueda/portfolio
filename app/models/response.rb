class Response < ApplicationRecord
  belongs_to :admin
  belongs_to :post


  validates :response, presence: true
  validates :post_id, presence: true
  validates :admin_id, presence: true
end

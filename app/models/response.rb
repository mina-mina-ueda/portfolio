class Response < ApplicationRecord
  belongs_to :admin
  belongs_to :post
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  validates :response, presence: true
  validates :post_id, presence: true
  validates :admin_id, presence: true
end

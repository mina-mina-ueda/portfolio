class Post < ApplicationRecord
  belongs_to :customer
  has_one :response
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
  validates :customer_id, presence: true

end

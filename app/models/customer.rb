class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :posts, dependent: :destroy
  has_many :event_posts, dependent: :destroy
end

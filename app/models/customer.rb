class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :event_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :nickname, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :work, presence: true
  validates :access, presence: true
end

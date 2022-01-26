class Event < ApplicationRecord
  belongs_to :admin
  has_many :event_posts, dependent: :destroy

 validates :admin_id, presence: true
 validates :title, presence: true
 validates :body, presence: true
 validates :period, presence: true
end

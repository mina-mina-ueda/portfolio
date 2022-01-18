class Event < ApplicationRecord
  belongs_to :admin
  has_many :event_posts, dependent: :destroy
end

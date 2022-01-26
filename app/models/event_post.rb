class EventPost < ApplicationRecord
  belongs_to :customer
  belongs_to :event

  validates :body, presence: true
  validates :customer_id, presence: true
  validates :event_id, presence: true
end

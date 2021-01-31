class Ticket < ApplicationRecord
  validates :seat_number, presence: true

  belongs_to :event
  belongs_to :ticket_status
end
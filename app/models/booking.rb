class Booking < ApplicationRecord
  belongs_to :booking_status
  belongs_to :event
  belongs_to :ticket
end
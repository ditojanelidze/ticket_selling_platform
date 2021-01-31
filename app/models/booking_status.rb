class BookingStatus < ApplicationRecord
  validates :id_name, presence: true, length: 50
  validates :name, presence: true, length: 100
end
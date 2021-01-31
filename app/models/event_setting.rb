class EventSetting < ApplicationRecord
  validates :rows_count, presence: true
  validates :seats_per_row, presence: true

  belongs_to :event
  belongs_to :ticket_selling_type
end
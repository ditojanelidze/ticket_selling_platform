class Event < ApplicationRecord
  validates :name, presence: true, length: 200
  validates :description, presence: true, length: 500

  has_one :event_setting
  has_many :tickets
end
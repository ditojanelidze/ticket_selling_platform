class CreateBookingStatus < ActiveRecord::Migration[6.0]
  class BookingStatus < ApplicationRecord; end

  def change
    create_table :booking_statuses do |t|
      t.string :name, null: false, limit: 100
      t.string :id_name, null: false, limit: 50
    end

    reversible do |mig|
      mig.up do
        BookingStatus.create(id_name: :reserved, name: "Ticket is reserved")
        BookingStatus.create(id_name: :canceled, name: "Ticket was reserved, but was canceled or released")
        BookingStatus.create(id_name: :booked, name: "Ticket is sold, booking is active")
      end

      mig.down do
        BookingStatus.destroy_all
      end
    end
  end
end

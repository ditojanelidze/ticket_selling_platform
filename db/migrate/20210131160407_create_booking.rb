class CreateBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :booking_status, foreign_key: true
      t.references :ticket, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end

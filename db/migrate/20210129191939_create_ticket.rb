class CreateTicket < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.references :ticket_status, null: false, foreign_key: true
      t.integer :seat_number, null: false
    end
  end
end

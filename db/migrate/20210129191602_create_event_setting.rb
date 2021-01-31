class CreateEventSetting < ActiveRecord::Migration[6.0]
  def change
    create_table :event_settings do |t|
      t.references :event, null: false, foreign_key: true
      t.references :ticket_selling_type, null: false, foreign_key: true
      t.decimal :ticket_price, null: false, precision: 10, scale: 2
      t.integer :rows_count, null: false
      t.integer :seats_per_row, null: false
    end
  end
end

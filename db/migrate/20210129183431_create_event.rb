class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false, limit: 200
      t.text :description, null: false, limit: 500
    end
  end
end

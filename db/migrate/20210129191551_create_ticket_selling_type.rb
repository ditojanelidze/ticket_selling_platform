class CreateTicketSellingType < ActiveRecord::Migration[6.0]
  class TicketSellingType < ApplicationRecord; end

  def change
    create_table :ticket_selling_types do |t|
      t.string :name, null: false, limit: 100
      t.string :id_name, null: false, limit: 50
    end

    reversible do |mig|
      mig.up do
        TicketSellingType.create(id_name: :even, name: "we can only buy tickets in quantity that is even")
        TicketSellingType.create(id_name: :all_together, name: "we can only buy all the tickets at once")
        TicketSellingType.create(id_name: :avoid_one, name: "we can only buy tickets in a quantity that will not leave only 1 ticket available")
      end

      mig.down do
        TicketSellingType.destroy_all
      end
    end
  end
end

class CreateTicketStatus < ActiveRecord::Migration[6.0]
  class TicketStatus < ApplicationRecord; end

  def change
    create_table :ticket_statuses do |t|
      t.string :name, null: false, limit: 100
      t.string :id_name, null: false, limit: 50
    end

    reversible do |mig|
      mig.up do
        TicketStatus.create(id_name: :available, name: "we can reserve ticket")
        TicketStatus.create(id_name: :reserved, name: "ticket is reserved, waiting for payment to be done")
        TicketStatus.create(id_name: :sold, name: "ticket is sold")
      end

      mig.down do
        TicketStatus.destroy_all
      end
    end
  end
end

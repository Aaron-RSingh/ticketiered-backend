class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket_class
      t.string :description
      t.integer :availability
      t.integer :price
      t.belongs_to :event
      t.timestamps
    end
  end
end

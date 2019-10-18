class CreateUsertickets < ActiveRecord::Migration[5.2]
  def change
    create_table :usertickets do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.timestamps
    end
  end
end

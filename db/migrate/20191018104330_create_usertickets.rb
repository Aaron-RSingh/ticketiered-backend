class CreateUsertickets < ActiveRecord::Migration[5.2]
  def change
    create_table :usertickets do |t|
      t.belongs_to :user
      t.belongs_to :ticket
      t.timestamps
    end
  end
end

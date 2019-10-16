class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date_time
      t.string :description
      t.string :image_url
      t.belongs_to :user
      t.timestamps
    end
  end
end

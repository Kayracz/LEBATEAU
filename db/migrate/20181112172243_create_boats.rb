class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :boat_type
      t.integer :size
      t.integer :capacity
      t.integer :price
      t.string :captain

      t.timestamps
    end
  end
end

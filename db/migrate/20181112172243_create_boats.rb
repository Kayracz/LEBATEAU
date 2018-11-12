class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :type
      t.integer :size
      t.integer :capacity
      t.integer :price
      t.string :captain

      t.timestamps
    end
  end
end

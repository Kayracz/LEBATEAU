class AddLocationToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :location, :string
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
  end
end

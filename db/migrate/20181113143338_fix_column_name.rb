class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :type, :model
  end
end

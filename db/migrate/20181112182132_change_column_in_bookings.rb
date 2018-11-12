class ChangeColumnInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :status, "confirmed"
  end
end

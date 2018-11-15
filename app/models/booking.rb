class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :renter_is_not_owner
  validates :start_date, :end_date, overlap: { scope: "boat_id" }

  private

  def end_date_after_start_date
    errors.add(:end_date, 'must be after start date') if end_date <= start_date
  end

  def renter_is_not_owner
    errors.add(:user, "can't be the same as boat owner") if user == boat.user
  end
end

class Boat < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings

  BOAT_TYPE = %w(All Yatch Sailboat Canoe Launch Houseboat Jetboat Uboat)

  has_many :rentee_users, through: :bookings, source: :user

  mount_uploader :photo, PhotoUploader
  validates :name, :boat_type, :size, :capacity, :price, :photo, presence: true
  validates :name, uniqueness: true
  validates :boat_type, inclusion: { in: BOAT_TYPE }
end


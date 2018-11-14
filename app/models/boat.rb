class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :rentee_users, through: :bookings, source: :user

  mount_uploader :photo, PhotoUploader

  validates :name, :boat_type, :size, :capacity, :price, :photo, presence: true
  validates :name, uniqueness: true
end

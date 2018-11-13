class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :rentee_users, through: :bookings, source: :user

  validates :name, presence: true
  validates :boat_type, presence: true
  validates :size, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end

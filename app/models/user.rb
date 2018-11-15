class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boats
  has_many :bookings
  has_many :rented_boats, through: :bookings, source: :boat

  validates :first_name, :last_name, presence: true

  mount_uploader :photo, PhotoUploader # copied this line from boat model
end

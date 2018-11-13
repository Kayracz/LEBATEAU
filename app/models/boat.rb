class Boat < ApplicationRecord
  belongs_to :user
  validates :name, :type, :size, :capacity, :price, presence: true
end

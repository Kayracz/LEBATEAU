class Boat < ApplicationRecord
  belongs_to :user
  validates :name, :model, :size, :capacity, :price, presence: true
end

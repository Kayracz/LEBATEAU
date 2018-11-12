class Boat < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :type, presence: true
  validates :size, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end

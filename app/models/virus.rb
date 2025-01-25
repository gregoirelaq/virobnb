class Virus < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end

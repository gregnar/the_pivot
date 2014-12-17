class Coordinate < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates :latitude, presence: true
  validates :longitude, presence: true
end

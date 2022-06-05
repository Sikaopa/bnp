class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :location
  after_validation :geocode
  has_one_attached :photo
  # , if: :will_save_change_to_address?
end

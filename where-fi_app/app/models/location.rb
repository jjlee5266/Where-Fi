class Location < ActiveRecord::Base
  has_and_belongs_to_many :users
  geocoded_by :address, latitude: :lat, longitude: :long
  after_validation :geocode, if: :address_changed?
end

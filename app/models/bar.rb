require 'net/http'
require 'json'
class Bar < ActiveRecord::Base

  belongs_to :crawl
  has_many :drinks

  validates :name, :address, :city, presence: true

  before_save :geocode_address

  def geocode_address
    uri_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address},#{city}&key=AIzaSyBX6s8EgaN-Pv8axPpoZvHYY4xL4fRHnck"
    uri_string.gsub!(" ", "+")
    uri = URI(uri_string)
    response = Net::HTTP.get uri
    location = JSON.parse response
    self.latitude = location["results"][0]["geometry"]["location"]["lat"].to_s
    self.longitude = location["results"][0]["geometry"]["location"]["lng"].to_s
  end
end

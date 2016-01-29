class Crawl < ActiveRecord::Base

  has_many :bars

  validates :name, presence: true

  def first_bar_coords
    bar = bars.first
    {lat: bar.latitude, lng: bar.longitude}
  end
end

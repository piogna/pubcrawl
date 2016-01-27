class Crawl < ActiveRecord::Base

  has_many :bars

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true

end
class Crawl < ActiveRecord::Base

  has_many :bars

  validates :name, presence: true

end
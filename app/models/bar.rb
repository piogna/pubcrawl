class Bar < ActiveRecord::Base

  belongs_to :crawl
  has_many :drinks

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :crawl_position, presence: true

end
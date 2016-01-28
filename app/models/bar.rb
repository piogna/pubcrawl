class Bar < ActiveRecord::Base

  belongs_to :crawl
  has_many :drinks

  validates :name, :address, :city, presence: true

end
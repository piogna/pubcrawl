class Bar < ActiveRecord::Base

  belongs_to :crawl
  has_many :drinks

  validates :name, presence: true

end
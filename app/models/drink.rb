class Drink < ActiveRecord::Base

  belongs_to :bar

  validates :name, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 20 }

end
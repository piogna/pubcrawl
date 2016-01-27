class Drink < ActiveRecord::Base

  belongs_to :bar

  validates :name, presence: true
  validates :type, presence: true

end
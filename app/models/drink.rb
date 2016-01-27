class Drink < ActiveRecord::Base

  belongs_to :bar

  validate :name, presence: true

end
require 'bcrypt'

class User < ActiveRecord::Base

  has_many :crawls

  has_secure_password

  validates :first_name, :last_name, presence: true

  validates :email,
    presence: true,
    uniqueness: true

end
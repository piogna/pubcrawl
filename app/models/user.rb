require 'bcrypt'

class User < ActiveRecord::Base

  has_many :crawls

  has_secure_password

end

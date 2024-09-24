class User < ApplicationRecord
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password
  validates :api_key, uniqueness: true

  has_secure_password
end
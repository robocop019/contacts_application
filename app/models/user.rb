class User < ApplicationRecord
  has_secure_password
  
  has_many :contacts

  validates :email, presence: true
  validates :email, uniqueness: true
end

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, length: { in: 6..30}


  has_secure_password
end

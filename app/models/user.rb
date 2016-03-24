class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :password, length: { in: 8..30}


  has_secure_password
end

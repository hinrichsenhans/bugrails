class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  # validates :password, length: { in: 6..30}

  has_many :developer_assigned_bugs, :class_name => 'Bugs', :foreign_key => 'developer_id'
  
  has_secure_password
end

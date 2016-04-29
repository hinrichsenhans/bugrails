class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  # validates :password, length: { in: 6..30}

  has_many :developer_assigned_bugs, :class_name => 'Bug', :foreign_key => 'developer_id'
  has_many :submitted_bugs, :class_name => 'Bug', :foreign_key => 'submitter_id'
  
  has_many :comments

  has_secure_password
end

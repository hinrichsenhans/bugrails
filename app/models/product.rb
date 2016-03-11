class Product < ActiveRecord::Base
  has_many :components
  has_many :versions
  has_many :milestones
  
  validates :name, presence: true


end

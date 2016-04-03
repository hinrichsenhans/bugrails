class Product < ActiveRecord::Base
  has_many :components
  has_many :versions
  has_many :milestones
  
  has_many :bugs

  validates :name, presence: true


end

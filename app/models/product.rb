class Product < ActiveRecord::Base
  has_many :components
  has_many :versions
  
  validates :name, presence: true


end

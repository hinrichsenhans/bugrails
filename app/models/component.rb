class Component < ActiveRecord::Base
  belongs_to :product
  
  has_many :bugs

  validates :product_id, presence: true
  validates_associated :product

  validates :name, presence: true


end

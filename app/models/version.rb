class Version < ActiveRecord::Base
  belongs_to :product

  validates :product_id, presence: true
  validates_associated :product

  validates :name, presence: true

end

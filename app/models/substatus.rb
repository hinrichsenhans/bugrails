class Substatus < ActiveRecord::Base
  validates :name, :uniqueness => true
  
  has_many :bugs
end

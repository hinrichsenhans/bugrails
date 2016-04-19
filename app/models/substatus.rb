class Substatus < ActiveRecord::Base
  validates :name, :uniqueness => true
  
  has_many :bugs

  def no_substatus?
    self.name == "---"
  end

end

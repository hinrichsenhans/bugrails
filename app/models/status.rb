class Status < ActiveRecord::Base
  validates :name, :uniqueness => true
  
  has_many :bugs
  
  def substatus_eligible
    case name
    when "NEW"
      false
    when "ASSIGNED"
      false
    when "REOPENED"
      false
    when "RESOLVED"
      true
    when "VERIFIED"
      true
    when "CLOSED"
      true
    else
      false
    end
  end

  def self.substatus_eligible_statuses
    '["RESOLVED", "VERIFIED", "CLOSED"]'
  end

  def active_statuses
    Status.where(name: ['NEW', 'ASSIGNED', 'REOPENED'])
  end

end

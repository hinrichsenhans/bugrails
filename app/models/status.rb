class Status < ActiveRecord::Base

  def substatus_eligible()
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
end

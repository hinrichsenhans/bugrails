class Status < ActiveRecord::Base

  # I'm going to break you of your C++ method naming :)
  # in ruby methods are snake_case and define the variables in your signature
  # def substatus_eligible
  # end
  #
  # I'm also surpised that this didn't blow up on name, and it infered that it
  # is the current instance of Status.  Hey I learned something today!
  def substatusEligible()
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

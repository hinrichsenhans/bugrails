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


    # rubyists tend to stay away from case statements, there are a few different
    # ways you could accomplish this code in a little less code
    # One would be to just look these up in a hash
    # return valid_statuses[name.downcase.to_sym] || false
  end


  #private 
  
    #def self.valid_statuses
      #{ new: true, assigned: false, reopned: false, resolved: true, verified: true, closed: false }
    #end

end

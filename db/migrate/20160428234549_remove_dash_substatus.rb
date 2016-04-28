class RemoveDashSubstatus < ActiveRecord::Migration
  def change
    Bug.find_each do |bug|
      if !bug.substatus.nil? && bug.substatus.name == "---"
        bug.substatus_id = nil
        bug.save!
      end
    end
  end
end

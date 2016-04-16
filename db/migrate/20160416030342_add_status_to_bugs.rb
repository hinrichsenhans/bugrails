class AddStatusToBugs < ActiveRecord::Migration
  def change
    add_foreign_key :bugs, :status
    add_foreign_key :bugs, :substatus
  end
end

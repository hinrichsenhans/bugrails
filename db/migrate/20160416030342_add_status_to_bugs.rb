class AddStatusToBugs < ActiveRecord::Migration
  def change
    add_foreign_key :bugs, :statuses
    add_foreign_key :bugs, :substatuses
  end
end

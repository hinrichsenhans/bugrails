class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      add_foreign_key :products
      
      t.timestamps null: false
    end
  end
end

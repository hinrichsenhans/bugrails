class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|

      t.string :title
      t.text :description

      t.integer :product_id
      t.integer :component_id
      t.integer :milestone_id
      t.integer :version_found_id
      t.integer :version_integrated_id

      t.integer :status_id
      t.integer :substatus_id

      t.integer :developer_id
      t.integer :submitter_id
      t.integer :tester_id

      t.decimal :dec_hours_estimated
      t.decimal :dec_hours_worked
      t.decimal :dec_hours_remaining

      t.datetime :submitted_dt
      t.datetime :closed_dt


      t.timestamps null: false
    end
  end
end

class AddProductForeignKeyToMilestone < ActiveRecord::Migration
  def change
    change_table :milestones do |t|
      t.integer :product_id
    end

    add_foreign_key :milestones, :products
  end
end

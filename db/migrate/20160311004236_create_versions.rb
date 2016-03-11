class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.integer :product_id

      t.timestamps null: false
    end

    add_foreign_key :versions, :products
    
  end
end

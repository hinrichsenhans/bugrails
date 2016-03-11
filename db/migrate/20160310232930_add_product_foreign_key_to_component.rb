class AddProductForeignKeyToComponent < ActiveRecord::Migration
  def change
    change_table :components do |t|
      t.integer :product_id
    end

    add_foreign_key :components, :products

  end
end

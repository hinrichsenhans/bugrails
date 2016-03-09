class CreateSubstatuses < ActiveRecord::Migration
  def change
    create_table :substatuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

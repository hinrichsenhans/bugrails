class AddPwdresetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reset_digest, :string
    add_column :users, :reset_requested_at, :datetime
  end
end

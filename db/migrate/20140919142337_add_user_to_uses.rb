class AddUserToUses < ActiveRecord::Migration
  def change
    add_column :uses, :user_id, :integer
    add_index :uses, :user_id
  end
end

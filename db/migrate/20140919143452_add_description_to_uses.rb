class AddDescriptionToUses < ActiveRecord::Migration
  def change
    add_column :uses, :description, :text
  end
end

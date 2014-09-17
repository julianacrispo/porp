class CreateUses < ActiveRecord::Migration
  def change
    create_table :uses do |t|
      t.text :case
      t.references :product, index: true

      t.timestamps
    end
  end
end

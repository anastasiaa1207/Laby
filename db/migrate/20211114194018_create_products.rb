class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :prod_id
      t.string :screen
      t.string :resolution
      t.string :cpu
      t.string :disk
      t.string :os

      t.timestamps
    end
    add_index :products, :prod_id, unique: true
  end
end

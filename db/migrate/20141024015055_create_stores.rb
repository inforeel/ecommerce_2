class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.text :name
      t.text :store_owner
      t.text :product

      t.timestamps
    end
  end
end

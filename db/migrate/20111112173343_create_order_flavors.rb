class CreateOrderFlavors < ActiveRecord::Migration
  def change
    create_table :order_flavors do |t|
      t.integer :flavor_id
      t.integer :order_product_id

      t.timestamps
    end
  end
end

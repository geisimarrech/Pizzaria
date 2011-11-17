class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :table_id
      t.integer :waiter_id
      t.integer :local_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end

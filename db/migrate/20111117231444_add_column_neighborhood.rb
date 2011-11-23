class AddColumnNeighborhood < ActiveRecord::Migration
  def up
     add_column :users, :neighborhood, :string
  end

  def down
    remove_column :users, :neighborhood
  end
end

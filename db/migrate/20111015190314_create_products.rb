class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer    :group_id,                :null => false
      t.text       :description           
      t.string     :unit                    
      t.float      :price,                   :null => false
      t.integer    :minimum_inventory
      t.integer    :maximum_inventory  
      t.timestamps
    end
  end
end

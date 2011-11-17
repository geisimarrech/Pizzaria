class AddColumnIconInGroups < ActiveRecord::Migration
  def up
    add_column :groups, :icon_file_name, :string
  end

  def down
    remove_column :groups, :icon_file_name
  end
end

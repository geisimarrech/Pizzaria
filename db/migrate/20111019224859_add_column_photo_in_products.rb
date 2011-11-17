class AddColumnPhotoInProducts < ActiveRecord::Migration
  def up
    add_column :products, :photo_file_name, :string
  end

  def down
    remove_column :products, :photo_file_name
  end
end

class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name

      t.timestamps
    end
  end
end

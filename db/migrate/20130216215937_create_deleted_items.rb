class CreateDeletedItems < ActiveRecord::Migration
  def change
    create_table :deleted_items do |t|
      t.integer :element
      t.string :table

      t.timestamps
    end
  end
end

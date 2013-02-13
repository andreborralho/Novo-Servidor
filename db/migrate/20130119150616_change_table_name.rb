class ChangeTableName < ActiveRecord::Migration
  def up
    rename_table :shows, :shows
  end

  def down
    rename_table :shows, :shows
  end
end

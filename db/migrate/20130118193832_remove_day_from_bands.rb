class RemoveDayFromBands < ActiveRecord::Migration
  def up
    remove_column :shows, :day
  end

  def down
    add_column :shows, :day, :date
  end
end

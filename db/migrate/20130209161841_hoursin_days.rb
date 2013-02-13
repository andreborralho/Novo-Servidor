class HoursinDays < ActiveRecord::Migration
  def up
    add_column :days, :opening_time, :closure_time
  end

  def down
    remove_column :days, :opening_time, :closure_time
  end
end

class AddClosingTimeToDays < ActiveRecord::Migration
  def change
    add_column :days, :closing_time, :time
  end
end

class Changesomevars < ActiveRecord::Migration
  def change
    add_column :shows, :day_id, :integer
    add_index :bands, :day_id, :name =>'index_bands_on_day_id'
  end

end

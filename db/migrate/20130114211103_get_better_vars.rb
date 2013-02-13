class GetBetterVars < ActiveRecord::Migration
  def change

      add_column :festivals, :country_id, :integer
  end


end

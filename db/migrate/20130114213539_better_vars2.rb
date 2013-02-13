class BetterVars2 < ActiveRecord::Migration
  def change

       add_index :festivals, :country_id, :name =>'index_festivals_on_country_id'
   end
end

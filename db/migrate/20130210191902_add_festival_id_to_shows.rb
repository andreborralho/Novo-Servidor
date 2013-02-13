class AddFestivalIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :festival_id, :integer
    add_column :users, :country_id, :integer

    add_index :shows, :festival_id, :name =>'index_shows_on_festival_id'
    add_index :users, :country_id, :name =>'index_users_on_country_id'
  end
end

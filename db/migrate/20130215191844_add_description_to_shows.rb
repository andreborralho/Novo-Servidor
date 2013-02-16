class AddDescriptionToShows < ActiveRecord::Migration
  def change
    add_column :shows, :description, :text
    rename_column :comments, :band_id, :show_id
    remove_index :comments, :band_id
    add_index :comments, :show_id, :name =>'index_comments_on_show_id'

  end
end

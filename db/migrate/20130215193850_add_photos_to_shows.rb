class AddPhotosToShows < ActiveRecord::Migration
  def change
    rename_column :photos, :band_id, :show_id

  end
end

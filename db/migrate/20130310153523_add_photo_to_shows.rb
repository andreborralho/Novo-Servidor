class AddPhotoToShows < ActiveRecord::Migration
  def change
    add_column :shows, :photo, :string
  end
end

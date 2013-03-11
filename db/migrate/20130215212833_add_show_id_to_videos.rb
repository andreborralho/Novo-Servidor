class AddShowIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :show_id, :integer

    add_index :videos, :show_id, :name =>'index_videos_on_show_id'
  end
end

class ChangeVarNames < ActiveRecord::Migration
  def up
    rename_column :festivals, :coord, :coordinates
    rename_column :festivals, :map_url, :map
    rename_column :festivals, :logo_url, :logo
    rename_column :festivals, :back_url, :template
  end

  def down
    rename_column :festivals, :coordinates, :coord
    rename_column :festivals, :map, :map_url
    rename_column :festivals, :logo, :logo_url
    rename_column :festivals, :template, :back_url
  end
end

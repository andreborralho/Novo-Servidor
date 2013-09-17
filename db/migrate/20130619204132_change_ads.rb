class ChangeAds < ActiveRecord::Migration
  def change
    change_column :ads, :banner, :string
    change_column :ads, :splash, :string
  end
end

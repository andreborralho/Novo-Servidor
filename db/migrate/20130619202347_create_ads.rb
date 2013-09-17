class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :name
      t.float :percentage
      t.datetime :due_date
      t.text :banner
      t.text :splash

      t.timestamps
    end
  end
end

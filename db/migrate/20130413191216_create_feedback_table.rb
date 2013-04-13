class CreateFeedbackTable < ActiveRecord::Migration
  def change
      create_table :feedback do |t|
        t.string :name
        t.text :text

        t.timestamps
      end

      add_column :festivals, :tickets_price, :string
    end
end

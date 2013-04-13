class DeleteFeedbackTable < ActiveRecord::Migration
  def change
    drop_table :feedback
  end
end

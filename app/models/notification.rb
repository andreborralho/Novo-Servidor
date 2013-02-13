class Notification < ActiveRecord::Base
  attr_accessible :festival_id, :text
  belongs_to :festival

  validates :text, :presence => true
end

class Video < ActiveRecord::Base
  belongs_to :show

  attr_accessible :url, :name, :show_id

  validates :url, :presence => true
end

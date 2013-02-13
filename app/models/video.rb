class Video < ActiveRecord::Base
  belongs_to :show
  attr_accessible :url

  validates :url, :presence => true

end

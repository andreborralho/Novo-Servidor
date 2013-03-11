class Show < ActiveRecord::Base
  belongs_to :stage
  belongs_to :day
  belongs_to :band
  belongs_to :festival

  attr_accessible :day, :name, :stage, :time , :photo, :description, :videos, :day_id, :stage_id, :band_id, :festival_id

  has_many :comments
  has_many :photos
  has_many :videos

  validates :name, :time, :day, :presence => true

  #accepts_nested_attributes_for :band

end

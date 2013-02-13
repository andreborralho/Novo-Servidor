class Day < ActiveRecord::Base
  belongs_to :festival
  has_many :shows

  attr_accessible :date, :opening_time, :closing_time

  validates :date, :presence => true
end

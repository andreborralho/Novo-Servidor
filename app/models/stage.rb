class Stage < ActiveRecord::Base
  belongs_to :festival
  has_many :shows
  attr_accessible :name

  validates :name, :presence => true
  validates :name, :uniqueness => true
end

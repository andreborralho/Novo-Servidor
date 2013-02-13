class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :shows, :dependent => :destroy
end

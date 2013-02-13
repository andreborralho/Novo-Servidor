class Gallery < ActiveRecord::Base
  belongs_to :festival
  attr_accessible :photo, :festival
end

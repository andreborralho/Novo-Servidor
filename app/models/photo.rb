class Photo < ActiveRecord::Base
  belongs_to :show
  attr_accessible :large, :small, :show_id
end

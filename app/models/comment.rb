class Comment < ActiveRecord::Base
  belongs_to :show
  #belongs_to :band

  attr_accessible :text, :name
end

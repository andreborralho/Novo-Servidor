class Feedback < ActiveRecord::Base
  attr_accessible :name, :text, :email
end

class Country < ActiveRecord::Base
  attr_accessible :name, :flag, :festivals
  has_many :festivals
  has_many :users
end

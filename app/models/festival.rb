class Festival < ActiveRecord::Base
  attr_accessible :template, :city, :coordinates, :logo, :map, :name, :tickets, :transports, :country_id, :days, :stages, :shows

  belongs_to :country
  has_many :days
  has_many :stages
  has_many :notifications
  has_many :galleries
  has_many :shows

  validates :name, :presence => true


end

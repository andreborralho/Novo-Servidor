class AdminController < ApplicationController
  def index
    @total_festivals = Festival.count
  end
end

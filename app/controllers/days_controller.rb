class DaysController < ApplicationController

  def index
    if params[:festival_id].nil?
      @days = Day.all
    else
      @festival = Festival.find(params[:festival_id])
      @days = @festival.days
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @days, :callback => params[:callback] }
    end
  end

  def create
    @festival = Festival.find(params[:festival_id])
    @day = @festival.days.create(params[:day])

    redirect_to festival_path(@festival)
  end

  def destroy
    @festival = Festival.find(params[:festival_id])
    @day = @festival.days.find(params[:id])

    if @day.shows.count == 0
      @deleted_item = DeletedItem.new
      @deleted_item.element = @day.id
      @deleted_item.table = :days
      @deleted_item.save
      @day.destroy
    end

    redirect_to festival_path(@festival)
  end

end

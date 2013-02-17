class StagesController < ApplicationController

  def index
    cache_page(:index)

    if params[:festival_id].nil?
      @stages = Stage.all
    else
      @festival = Festival.find(params[:festival_id])
      @stages = @festival.stages
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stages, :callback => params[:callback] }
    end
  end

  def create
  expire_page :action => :index
  @festival = Festival.find(params[:festival_id])
  @stage = @festival.stages.create(params[:stage])

  redirect_to festival_path(@festival)
  end

  def destroy
    @festival = Festival.find(params[:festival_id])
    @stage = @festival.stages.find(params[:id])
    @deleted_item = DeletedItem.new
    @deleted_item.element = @stage.id
    @deleted_item.table = :stages
    @deleted_item.save
    @stage.destroy
    redirect_to festival_path(@festival)
  end
end

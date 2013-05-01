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

  # GET /stages/1/edit
  def edit
    @stage = Stage.find(params[:id])
    @festival = Festival.find(@stage.festival.id)
  end

  def create
    expire_page :action => :index
    @festival = Festival.find(params[:festival_id])
    @stage = @festival.stages.create(params[:stage])

    redirect_to festival_path(@festival)
  end

  # PUT /stages/1
  # PUT /stages/1.json
  def update
    @stage = Stage.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { redirect_to festival_path(@stage.festival.id), notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @festival = Festival.find(params[:festival_id])
    @stage = @festival.stages.find(params[:id])

    if @stage.shows.count == 0
      @deleted_item = DeletedItem.new
      @deleted_item.element = @stage.id
      @deleted_item.table = :stages
      @deleted_item.save
      @stage.destroy
    end

    redirect_to festival_path(@festival)
  end

end

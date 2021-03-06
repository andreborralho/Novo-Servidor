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

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
    @festival = Festival.find(@day.festival.id)
  end

  def create
    @festival = Festival.find(params[:festival_id])
    @day = @festival.days.create(params[:day])

    redirect_to festival_path(@festival)
  end

  # PUT /days/1
  # PUT /days/1.json
  def update
    @day = Day.find(params[:id])

    respond_to do |format|
      if @day.update_attributes(params[:day])
        format.html { redirect_to festival_path(@day.festival.id), notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
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

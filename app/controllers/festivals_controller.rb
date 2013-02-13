class FestivalsController < ApplicationController
  #before_filter :authorize
  # GET /festivals
  # GET /festivals.json
  def index
 #  @festivals = current_user.festivals
    cache_page(:index)

    if session[:user_id].nil?
      @festivals = Festival.all
    elsif User.find_by_id(session[:user_id]).name == 'admin'
      @festivals = Festival.all
    else
      @festivals = User.find_by_id(session[:user_id]).festivals
    end

    if params[:country_id].nil?
      @festivals = Festival.all
      @stages = Stage.all
      @days = Day.all
      @shows = Show.all
      @comments = Comment.all
      @countries = Country.all
      @notifications = Notification.all
      @galleries = Gallery.all
      @photos = Photo.all

            #if params[:modified_since].nil?
             # @festivals.find(updated_at > modified-since
            #end
    else
      @country = Country.find(params[:country_id])
      @festivals = @country.festivals
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>{
          :festivals => @festivals,
          :stages => @stages,
          :days => @days,
          :countries => @countries,
          :comments => @comments,
          :notifications => @notifications,
          :photos => @photos,
          :galleries => @galleries,
          :shows => @shows}, :callback => params[:callback] }
    end
  end

  # GET /festivals/1
  # GET /festivals/1.json
  def show
    @festival = Festival.find(params[:id])
    $current_festival_id = @festival.id
    $stages = @festival.stages
    $days = @festival.days
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @festival, :callback => params[:callback] }
    end
  end

  # GET /festivals/new
  # GET /festivals/new.json
  def new
    @festival = Festival.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @festival }
    end
  end

  # GET /festivals/1/edit
  def edit
    @festival = Festival.find(params[:id])
  end

  # POST /festivals
  # POST /festivals.json
  def create
    expire_page :action => :index

    @festival = Festival.new(params[:festival])
    @festival.country_id = Festival.new(params[:country])

    @user = User.find_by_id(session[:user_id])
    #@festival = @user.festivals.create(params[:festival])

    respond_to do |format|
      if @festival.save
        format.html { redirect_to @festival, notice: 'Festival was successfully created.' }
        format.json { render json: @festival, status: :created, location: @festival }
      else
        format.html { render action: "new" }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /festivals/1
  # PUT /festivals/1.json
  def update
    @festival = Festival.find(params[:id])

    respond_to do |format|
      if @festival.update_attributes(params[:festival])
        format.html { redirect_to @festival, notice: 'Festival was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /festivals/1
  # DELETE /festivals/1.json
  def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy

    respond_to do |format|
      format.html { redirect_to festivals_url }
      format.json { head :no_content }
    end
  end
end

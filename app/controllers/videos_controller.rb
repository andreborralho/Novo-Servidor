class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index

    if params[:show_id]
      @show = Show.find(params[:show_id])
      @videos = @show.videos
    else
      @videos = Video.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos, :callback => params[:callback] }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    if params[:show]
      @show = Show.find(params[:show])
      @video.show_id = @show.id
    else
      @video.show_id = $current_show_id
      @show = Show.find($current_show_id)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @show = Show.find($current_show_id)
    @video = @show.videos.create(params[:video])

    redirect_to show_path(@show)

  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @show = Show.find(params[:show_id])
    @video = @show.videos.find(params[:id])
    #@video = Video.find(params[:id])

    @deleted_item = DeletedItem.new
    @deleted_item.element = @video.id
    @deleted_item.table = :videos
    @deleted_item.save
    @video.destroy

    redirect_to show_path(@show)
  end
end

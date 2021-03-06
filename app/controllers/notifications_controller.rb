class NotificationsController < ApplicationController
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.find_all_by_festival_id(params[:current_festival_id])
    #@notifications = Notification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notifications, :callback => params[:callback] }
    end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @notification = Notification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/new
  # GET /notifications/new.json
  def new
    @notification = Notification.new
    $current_festival_id = Festival.find(params[:festival]).id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/1/edit
  def edit
    @notification = Notification.find(params[:id])
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(params[:notification])
    @notification.festival_id = $current_festival_id

    respond_to do |format|
      if @notification.save
        format.html { redirect_to Festival.find($current_festival_id), notice: 'Notification was successfully created.' }
        format.json { render json: @notification, status: :created, location: @notification }
      else
        format.html { render action: "new" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notifications/1
  # PUT /notifications/1.json
  def update
    @notification = Notification.find(params[:id])

    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification = Notification.find(params[:id])
    @deleted_item = DeletedItem.new
    @deleted_item.element = @notification.id
    @deleted_item.table = :notifications
    @deleted_item.save
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to Festival.find(@notification.festival_id) }
      format.json { head :no_content }
    end
  end
end

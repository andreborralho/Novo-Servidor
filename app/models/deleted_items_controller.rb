class DeletedItemsController < ApplicationController
  # GET /deleted_items
  # GET /deleted_items.json
  def index
    @deleted_items = DeletedItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deleted_items }
    end
  end

  # GET /deleted_items/1
  # GET /deleted_items/1.json
  def show
    @deleted_item = DeletedItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deleted_item }
    end
  end

  # GET /deleted_items/new
  # GET /deleted_items/new.json
  def new
    @deleted_item = DeletedItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deleted_item }
    end
  end

  # GET /deleted_items/1/edit
  def edit
    @deleted_item = DeletedItem.find(params[:id])
  end

  # POST /deleted_items
  # POST /deleted_items.json
  def create
    @deleted_item = DeletedItem.new(params[:deleted_item])

    respond_to do |format|
      if @deleted_item.save
        format.html { redirect_to @deleted_item, notice: 'Deleted item was successfully created.' }
        format.json { render json: @deleted_item, status: :created, location: @deleted_item }
      else
        format.html { render action: "new" }
        format.json { render json: @deleted_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deleted_items/1
  # PUT /deleted_items/1.json
  def update
    @deleted_item = DeletedItem.find(params[:id])

    respond_to do |format|
      if @deleted_item.update_attributes(params[:deleted_item])
        format.html { redirect_to @deleted_item, notice: 'Deleted item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deleted_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deleted_items/1
  # DELETE /deleted_items/1.json
  def destroy
    @deleted_item = DeletedItem.find(params[:id])
    @deleted_item.destroy

    respond_to do |format|
      format.html { redirect_to deleted_items_url }
      format.json { head :no_content }
    end
  end
end

class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    cache_page(:index)
    if params[:show_id].nil?
       if params[:show].nil?  then
       @comments = Comment.all

       else
       @comments = Show.find(params[:show]).comments
      end
    else
    @show = Show.find(params[:show_id])
    @comments = @show.comments
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments, :callback => params[:callback] }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    $show_id = params[:show]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    expire_page :action => :index


    if params[:show_id].nil?
      @show = Show.find($show_id)
      @comment = Comment.new(params[:comment])
      @comment = @show.comments.create(params[:comment])

    else
      @show = Show.find(params[:show_id])
      @comment = Comment.new({name: params[:nome], text: params[:texto]})
      @comment = @show.comments.create({name: params[:nome], text: params[:texto]})

    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @deleted_item = DeletedItem.new
    @deleted_item.element = @comment.id
    @deleted_item.table = :comments
    @deleted_item.save
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end

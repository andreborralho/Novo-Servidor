class ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  def index
    cache_page(:index)

    if params[:festival_id].nil?
      @shows = Show.all
    else
      @festival = Festival.find(params[:festival_id])
      #@shows = Array.new
      @shows = @festival.shows
      #@festival.shows.all.each do |s|
       #   @shows << s
      #end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shows, :callback => params[:callback] }
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = Show.new
    if params[:festival_id].nil?
      @show.festival_id = $current_festival_id
      @festival = Festival.find($current_festival_id)
      $stages = @festival.stages
      $days = @festival.days
    else
      @festival = Festival.find(params[:festival_id])
      @show.festival_id = @festival.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @show }
    end
  end


  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
    @festival = Festival.find(@show.festival.id)
    $stages = @festival.stages
    $days = @festival.days
  end

  # POST /shows
  # POST /shows.json
  def create
    expire_page :action => :index

    @festival = Festival.find(params[:festival_id])
    @show = @festival.shows.create(params[:show])
    $stages = @festival.stages
    $days = @festival.days

    redirect_to festival_path(@festival)

   # agent = Mechanize.new
    #puts b.name.gsub(" ", '+')
   # bandName = @band.name.gsub("+", "%252B")

   # page = agent.get('http://www.lastfm.com.br/music/'+bandName.gsub(" ", '+')+'/+images');
    #page = agent.get('http://www.lastfm.com.br/music/Busy+P/+images');
   # smallImages = Array.new
   # largeImages = Array.new
   # agent.page.search("#pictures img").each do |mini|
    #  smallImages << mini.attributes['src']
   # end

    #agent.page.search("#pictures a").each do |image|
    #  agent2 = Mechanize.new
     # image2 = agent2.get('http://www.lastfm.com.br'+image.attributes['href']);
      # puts image.attributes['href']
      #agent2.page.search(".the-image img").each do |big|
        #puts big.attributes['src']
       # largeImages << big.attributes['src']
      #end

    #end

    #for i in 0..smallImages.size-1 do
    #  puts smallImages[i]
    #  puts largeImages[i]

     # @image = Photo.new({band_id: @band.id, small: smallImages[i].inner_text, large: largeImages[i].inner_text})
     # @image.save
    #end
    #respond_to do |format|
     # if @show.save
      #  format.html { redirect_to @show, notice: 'Show was successfully created.' }
       # format.json { render json: @show, status: :created, location: @show}
      #else
       # format.html { render action: "new" }
       # format.json { render json: @show.errors, status: :unprocessable_entity }
      #end
   # end
  end

  # PUT /bands/1
  # PUT /bands/1.json
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to Festival.find(@show.festival_id) }
      format.json { head :no_content }
    end
  end
end

class HousingsController < ApplicationController
  # GET /housings
  # GET /housings.xml
  def index
    @housing_count = Housing.count
    @housings = Housing.all
    @categories = Category.where(:parent => "Rent")
    @latest_listings = Housing.order("created_at DESC").limit(4)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housings }
    end
  end

  # GET /housings/1
  # GET /housings/1.xml
  def show
    @housing = Housing.find(params[:id])
    @address = @housing.address.to_s + ', '  + @housing.city.to_s + ', ' + @housing.state.to_s    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing }
    end
  end

  def search
     @search_housing_title = Housing.where(:title.matches => @query)
     @search_housing_description = Housing.where(:description.matches => @query)
     @search = Housing.search(params[:searchbar])
  end

  # GET /housings/new
  # GET /housings/new.xml
  def new
    @user = UserSession.find
    if @user.nil?
      flash[:notice] = "Please sign in order to post new housing listings."
      redirect_to(:controller => "user_session", :action => "new")
    else
      @housing = Housing.new
      @categories = Category.where(:parent => "Rent")
      2.times {@housing.housing_images.build} #initializes 3 images for each housing listing
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @housing }
      end
    end
  end

  # GET /housings/1/edit
  def edit
    @housing = Housing.find(params[:id])
    @categories = Category.where(:parent => "Rent")
    2.times {@housing.housing_images.build} #initializes 3 images for each housing listing
  end


  def list_by_category
    @housing_count = Housing.count
    if params[:id] < 19
      @housings = Housing.where(:category_id => params[:id])
    elsif params[:id] == 411
      @housings = Housing.all
    end
    @categories = Category.where(:parent => "Rent")
    render :index
  end
  # POST /housings
  # POST /housings.xml
  def create
    @housing = Housing.new(params[:housing])
    @categories = Category.where(:parent => "Rent")
    
    respond_to do |format|
      if @housing.save
        format.html { redirect_to(@housing, :notice => 'Your housing classified was successfully created!') }
        format.xml  { render :xml => @housing, :status => :created, :location => @housing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housings/1
  # PUT /housings/1.xml
  def update
    @housing = Housing.find(params[:id])

    respond_to do |format|
      if @housing.update_attributes(params[:housing])
        format.html { redirect_to(@housing, :notice => 'Housing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.xml
  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy

    respond_to do |format|
      format.html { redirect_to(housings_url) }
      format.xml  { head :ok }
    end
  end
end

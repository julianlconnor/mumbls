class ListingsController < ApplicationController
  #before_filter :require_user, :only => [:new, :create, :destroy]
  
  # GET /listings
  # GET /listings.xml
  def index
    @listings = Listing.all
    @categories = Category.where(:parent => "Items")
    @latest_listings = Listing.order("created_at DESC").limit(4)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @show_listing = Listing.find(params[:id])
    flash[:error] = "Listing not found" and return unless @show_listing
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end
  
  def search
    @search = Listing.search() do
      keywords(params[:searchbar])
    end
  end
    
  def list_by_category
    @listings = Listing.where(:category_id => params[:id])
  end


  # GET /listings/new
  # GET /listings/new.xml
  def new
    @user = UserSession.find
    if @user.nil?
      flash[:notice] = "Please sign in to create a new listing."
      redirect_to(:controller => "user_session", :action => "new")
    else
      @listing = Listing.new
      @categories = Category.where(:parent => "Items")
      3.times {@listing.listing_images.build} #initializes 3 images for each user
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @listing }
      end
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
    3.times {@listing.listing_images.build} #initializes 3 images for each user
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to(@listing, :notice => 'Your listing was successfully created.') }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to(@listing, :notice => 'Listing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end

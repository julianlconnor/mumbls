class HomeController < ApplicationController
  def index
    # Fetch categories for drop down
    @categories = Category.all
    # Fetch all categories with parent = Items, Jobs, and Rent
    @items = Category.where(:parent => "Items")
    @jobs = Category.where(:parent => "Jobs")
    @rent = Category.where(:parent => "Rent")
    # Find last 3 posted listings
    @latest_listings = Listing.order("created_at DESC").limit(3)
    # Find last 3 posted housings
    @latest_housings = Housing.order("created_at DESC").limit(3)
  end
  
  def dashboard
     @user = UserSession.find
      if @user.nil?
        flash[:notice] = "Please log in to see your dashboard. ;)"
        redirect_to(:controller => "user_session", :action => "new")
      else
        @listings = Listing.order("created_at DESC").where(:author_id => @user.user.id).limit(5)
        @housings = Housing.order("created_at DESC").where(:author_id => @user.user.id).limit(5)
        
        respond_to do |format|
          format.html # dashboard.html.erb
        end
      end
  end
  
  def search
    # Build hash of results
    c_id = params[:category_id]
    if c_id == "all" # User wants to search all models
      @h_results = Housing.search() do
        keywords(params[:searchbar])
      end
      @l_results = Listing.search() do
        keywords(params[:searchbar])
      end
      # Job results go here
    elsif c_id == "listings"
      @l_results = Listing.search() do
        keywords(params[:searchbar])
      end
    elsif c_id == "housings"
       @h_results = Housing.search() do
          keywords(params[:searchbar])
        end
    else
      c_id = c_id.to_i
      if c_id > 0 and c_id <= 6 # Category ID points at listing items
        @l_results = Listing.search() do
          keywords(params[:searchbar])
          with(:category_id).equal_to(params[:category_id])
        end
      elsif c_id >= 7 and c_id <= 11 # Category ID points at Jobs
        # Still need to implement Jobs
      else # Category ID points to housings
        @h_results = Housing.search() do
          keywords(params[:searchbar])
          with(:category_id).equal_to(params[:category_id])
        end
      end
    end
  end
  
end

class HomeController < ApplicationController
  def index
    # Fetch categories for drop down
    @categories = Category.all
    # Fetch all categories with parent = Items, Jobs, and Rent
    @items = Category.where(:parent => "Items")
    @jobs = Category.where(:parent => "Jobs")
    @rent = Category.where(:parent => "Rent")
    # Find last 3 posted listings
    @latest_listings = Listing.order("created_at DESC").limit(8)
    # Find last 3 posted housings
    @latest_housings = Housing.order("created_at DESC").limit(10)
    @premium_listings = Listing.where(:is_prem => true).order("created_at DESC").limit(12)
  end
  
  def dashboard
     @user = UserSession.find
      if @user.nil?
        flash[:notice] = "Please log in to see your dashboard. ;)"
        redirect_to(:controller => "user_session", :action => "new")
      else
        if @user.user.user_role == "admin"
          @mod_listings = Listing.all
          @mod_housings = Housing.all
          debugger
        end
        @listings = Listing.order("created_at DESC").where(:user_id => @user.user.id)
        @housings = Housing.order("created_at DESC").where(:user_id => @user.user.id)
        respond_to do |format|
          format.html # dashboard.html.erb
        end
      end
  end
  def about    
    respond_to do |format|
      format.html # about.html.erb
    end        
  end
  
  def search
    # Build hash of results
    @query = params[:searchbar]
    @category_id = params[:category_id]
    c_id = params[:category_id]
    if c_id == "all" # User wants to search all models
      @l_search = Listing.search(params[:searchbar])
      @h_search = Housing.search(params[:searchbar])
      @category_name = "All"
      # Job results go here
    elsif c_id == "listings"
      @l_search = Listing.search(params[:searchbar])
      @category_name = "Listings"
    elsif c_id == "housings"
      @h_search = Housing.search(params[:searchbar])
      @category_name = "Housings"
    else
      c_id = c_id.to_i
      if c_id > 0 and c_id <= 6 or c_id == 16 # Category ID points at listing items
        @category_name = Category.where(:id => c_id).first.name.to_s
        @l_search = Listing.search(params[:searchbar]).where(:category_id => c_id)
      elsif c_id >= 7 and c_id <= 11 or c_id == 17 # Category ID points at Jobs
        # Still need to implement Jobs
      else # Category ID points to housings
        @category_name = Category.where(:id => c_id).first.name.to_s
        @l_search = Listing.search(params[:searchbar]).where(:category_id => c_id)
      end
    end
    @categories = Category.all
    @items = Category.where(:parent => "Items")
    @jobs = Category.where(:parent => "Jobs")
    @rent = Category.where(:parent => "Rent")
    #debugger
  end
  
end

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
    @query = '%' + params[:searchbar].to_s + '%'
    if c_id == "all" # User wants to search all models
      @search_listing_title = Listing.where(:title.matches => @query)
      @search_listing_description = Listing.where(:description.matches => @query)
      @search_housing_title = Housing.where(:title.matches => @query)
      @search_housing_description = Housing.where(:description.matches => @query)
      @search = @search_listing_title | @search_listing_description | @search_housing_description | @search_housing_title
      # Job results go here
    elsif c_id == "listings"
      @search_listing_title = Listing.where(:title.matches => @query)
      @search_listing_description = Listing.where(:description.matches => @query)
      @search = @search_listing_title | @search_listing_description
    elsif c_id == "housings"
       @search_housing_title = Housing.where(:title.matches => @query)
       @search_housing_description = Housing.where(:description.matches => @query)
       @search = @search_housing_description | @search_housing_title
    else
      c_id = c_id.to_i
      if c_id > 0 and c_id <= 6 # Category ID points at listing items
        @search_listing_title = Listing.where(:title.matches => @query, :category_id => c_id)
        @search_listing_description = Listing.where(:description.matches => @query, :category_id => c_id)
        @search = @search_listing_description | @search_listing_title
      elsif c_id >= 7 and c_id <= 11 # Category ID points at Jobs
        # Still need to implement Jobs
      else # Category ID points to housings
        @search_housing_title = Housing.where(:title.matches => @query, :category_id => c_id)
        @search_housing_description = Housing.where(:description.matches => @query, :category_id => c_id)
        @search = @search_housing_description | @search_housing_title
      end
    end
  end
  
end

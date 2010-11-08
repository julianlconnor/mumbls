class HomeController < ApplicationController
  def index
    @categories = Category.all
    @items = Category.where(:parent => "Items")
    @jobs = Category.where(:parent => "Jobs")
    @rent = Category.where(:parent => "Rent")
    @latest_listings = Listing.order("created_at DESC").limit(4)
    @latest_housings = Housing.order("created_at DESC").limit(4)
  end
  
  def search
    # Build hash of results
    c_id = params[:category_id].to_i
    if c_id == 0
      @h_results = Housing.search() do
        keywords(params[:searchbar])
      end
      @l_results = Listing.search() do
        keywords(params[:searchbar])
      end
      # Job results go here
    else
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
          with(:category_id.equal_to(params[:category_id])
        end
      end
    end
  end
  
end

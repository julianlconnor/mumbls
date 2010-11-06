class HomeController < ApplicationController
  def index
    @categories = Category.all
    @latest_listings = Listing.order("created_at DESC").limit(4)
    @latest_housings = Housing.order("created_at DESC").limit(4)
  end
  def search
    puts params
    @search = Housing.search() do
      keywords(params[:searchbar])
    end
  end
end

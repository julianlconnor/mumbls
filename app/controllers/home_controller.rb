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
    @search = Housing.search() do
      keywords(params[:searchbar])
      if params[:category_id].to_i > 0
        with(:category_id).equal_to(params[:category_id])
      end
    end
  end
end

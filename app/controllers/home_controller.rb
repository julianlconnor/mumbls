class HomeController < ApplicationController
  def index
    @listings = Listing.all
  end
end

class HomepagesController < ApplicationController
  def index
    @listings = Listing.all
  end
end

class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @listings = Listing.all

    if params[:location].present?
      @listings = @listings.where('location ILIKE ?', "%#{params[:location]}%")
    end

    if params[:available].present?
      @listings = @listings.where(available: true)
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  end
end

private

def listing_params
  params.require(:listing).permit(:property_type, :price, :location, :description, :title, :rooms, :capacity, :user_id, :available)
end

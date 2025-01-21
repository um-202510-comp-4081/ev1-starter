class DogListingsController < ApplicationController
  def index
    @dog_listings = DogListing.all
    render :index
  end

  def show
    @dog_listing = DogListing.find(params[:id])
    render :show
  end

  def new
    @dog_listing = DogListing.new
    render :new
  end

  def create
    @dog_listing = DogListing.new(params.require(:dog_listing).permit(:name, :breed, :sex, :weight, :price, :seller_email))
    if @dog_listing.save
      flash[:success] = 'Dog listing was successfully created.'
      redirect_to dog_listing_path(@dog_listing)
    else
      flash.now[:error] = 'Unable to create dog listing.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dog_listing = DogListing.find(params[:id])
    render :edit
  end

  def update
    @dog_listing = DogListing.find(params[:id])
    if @dog_listing.update(params.require(:dog_listing).permit(:name, :breed, :sex, :weight, :price, :seller_email))
      flash[:success] = 'Dog listing was successfully updated.'
      redirect_to dog_listing_path(@dog_listing)
    else
      flash.now[:error] = 'Unable to update dog listing.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog_listing = DogListing.find(params[:id])
    @dog_listing.destroy
    flash[:success] = 'Dog listing was successfully destroyed.'
    redirect_to dog_listings_url
  end
end

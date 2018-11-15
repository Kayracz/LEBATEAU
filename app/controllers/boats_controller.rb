class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_boat, only: [:edit, :update, :destroy]
  def index
    @boats = Boat.all
    @booking = Booking.new

    @boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @boats.map do |boat|
      {
        lng: boat.longitude,
        lat: boat.latitude
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @bookings = Booking.where(boat: params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    @boat.user = current_user

    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boat_path(@boat)
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to root_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :boat_type, :size, :capacity, :price, :photo) # this is called strong params, for security
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end

class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_boat, only: [:edit, :update, :destroy]

  def index
    if params[:boat_type] == "All" || params[:boat_type].nil?
      @boats = Boat.all
    else
      @boats = Boat.where(boat_type: params[:boat_type])
    end

    @booking = Booking.new

    @map_boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @map_boats.map do |boat|
      {
        lng: boat.longitude,
        lat: boat.latitude,
        infoWindow: { content: render_to_string(partial: "/boats/map_window", locals: { boat: boat }) }
      }
    end
    respond_to do |format|
      format.js
      format.html
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
    @boat = Boat.new(boat_params)
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
    params.require(:boat).permit(:name, :boat_type, :size, :capacity, :price, :description, :photo)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end

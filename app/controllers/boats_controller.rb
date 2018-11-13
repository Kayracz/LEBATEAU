class BoatsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index]

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
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

  private

  def boat_params
    params.require(:boat).permit(:name, :boat_type, :size, :capacity, :price, :photo) # this is called strong params, for security
  end

end

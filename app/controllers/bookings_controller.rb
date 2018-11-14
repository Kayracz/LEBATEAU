class BookingsController < ApplicationController

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    # @all_users = User.all
  end


  def show  # Added in Nick_Booking_show branch
    @booking = Booking.find(params[:id])
  end


  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save
      redirect_to boat_booking_path(@boat, @booking)  # need to pass the ids of both the boat and booking
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to boat_path(@booking.boat)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

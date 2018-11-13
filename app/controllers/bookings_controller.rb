class BookingsController < ApplicationController
  def show
  end

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

    # @dose.ingredient_id = ingredient_id_params[:ingredient_id].to_i
    return redirect_to boat_path(@boat) if @booking.save
    render :new # this goes to the new.html.erb in the doses folder, which requires @all_ingredients
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to boat_path(@booking.boat)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :boat_id, :user_id)
  end
end

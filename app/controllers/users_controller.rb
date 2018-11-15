class UsersController < ApplicationController
  def show
    @user = current_user
    @bookings = current_user.bookings
    @rented_boats = current_user.rented_boats
    @owned_boats = current_user.boats
  end
end

class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
end
#require 'vienna_lunch/namespace'

class RestaurantsController < ApplicationController
  def index
    @restaurants = ViennaLunch::Restaurants::load_all
    render json: @restaurants
  end
end

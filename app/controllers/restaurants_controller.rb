#require 'vienna_lunch/namespace'

class RestaurantsController < ApplicationController
  def index
    if Rails.env.development?
      render :file => 'lib/vienna_lunch/support/restaurants.json', content_type: "application/json"
    else
      @restaurants = cached_restaurants
      render json: @restaurants
    end
  end

  def cached_restaurants
    Rails.cache.fetch('restaurants_list', :expires_in => 10.minutes) do
      ViennaLunch::Restaurants::load_all
    end
  end
end

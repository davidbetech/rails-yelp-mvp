class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  @restaurant = Restaurant.new
  end
  def create
  @restaurants = Restaurant.new(restaurant_params)
  @restaurants.save
  if @restaurants.save
    redirect_to @restaurants
  else
    render :new
  end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :addres, :phone_number, :category)
  end
end

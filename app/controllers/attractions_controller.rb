class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end

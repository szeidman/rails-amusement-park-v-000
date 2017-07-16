class RidesController < ApplicationController
  def new
    @ride = Ride.new
    @ride.user_id = params[:user_id]
    @ride.attraction_id = params[:attraction_id]
    @messages = @ride.take_ride
    @user = @ride.user
    if !@user.admin
      redirect_to user_path(@user), notice: @messages
    else
      "Admin!"
    end
  end

  def create

  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end

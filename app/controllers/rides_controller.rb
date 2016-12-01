class RidesController < ApplicationController
  def take_ride
      @ride = Ride.new

      @ride.user = current_user
      @ride.attraction_id = session[:attraction_id]
      if (@ride.user.tickets >= @ride.attraction.tickets && @ride.user.height >= @ride.attraction.min_height)
        @ride.user.tickets = @ride.user.tickets - @ride.attraction.tickets
        @ride.user.happiness = @ride.user.happiness + @ride.attraction.happiness_rating
        @ride.user.nausea = @ride.user.nausea + @ride.attraction.nausea_rating
        @ride.user.save
        @ride.save
        flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
        redirect_to user_path(@ride.user)
      elsif (@ride.user.tickets < @ride.attraction.tickets && @ride.user.height < @ride.attraction.min_height)
        flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name} You are not tall enough to ride the #{@ride.attraction.name}"
        redirect_to user_path(@ride.user)
      elsif @ride.user.height < @ride.attraction.min_height
        flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name}"
        redirect_to user_path(@ride.user)
      elsif @ride.user.tickets < @ride.attraction.tickets
        flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name}"
        redirect_to user_path(@ride.user)
      end
  end
end

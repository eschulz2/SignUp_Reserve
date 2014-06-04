class SeatsController < ApplicationController
  def reserve_seat
  	@seat = Seat.find(params["seat_id"])
  	@prev_seat = Seat.where(event_id: params["event_id"],
  		                     user_id: current_user.id).first
  	if @prev_seat
  		@prev_seat.update(user.id: nil)
  	else
  		current_user.credit -=1
  		current_user.save
  	end
  	@seat.update(user_id: current_user.id)
  	redirect_to event_path(@seat.event)
  end
end
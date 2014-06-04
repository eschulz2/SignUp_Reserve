class SeatsController < ApplicationController
  def reserve_seat
  	@seat = Seat.find(params["seat_id"])
  	@prev_seat = Seat.where(event_id: params["event_id"],
  		                     user_id: current_user.id).first
  	if @prev_seat
  		@prev_seat.update(user.id: nil)
      @seat.update(user_id: current_user.id)
  	else
  		if current_user.has_credits?
        current_user.credit -=1
        current_user.save
        @seat.update(user_id: current_user.id)
      end
  	end
  	redirect_to event_path(@seat.event)
  end
end
class SeatsController < ApplicationController
  def reserve_seat
  	@seat = Seat.find(params["seat_id"])
  	@prev_seat = Seat.where(event_id: params["event_id"],
  		                     user_id: current_user.id).first
  	if @prev_seat
  		@prev_seat.update(user_id: nil)
      @seat.update(user_id: current_user.id)
  	else
  		if current_user.has_credits?
        current_user.deduct_credit
        @seat.update(user_id: current_user.id)
      end
  	end
  	redirect_to event_path(@seat.event)
  end

  def cancel_reservation
    @event = Event.find(params["event_id"])
    if @seat = @event.attendees_seat(current_user.id)
      @seat.cancel_reservation
      current_user.add_credit
      @seat.save
      current_user.save
    end
    redirect_to event_path(@event)
  end
end
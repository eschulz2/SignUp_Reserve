class Seat < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def attendee
  	self.user
  end

  def taken?
  	self.attendee ? true : false
  end

  def available?
  	!taken?
  end

  def cancel_reservation
    self.user_id = nil
  end
end
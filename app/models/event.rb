class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :seats
  has_and_belongs_to_many :attendees, join_table: "seats", class_name: "User"

  def seat_rows(row_length=3)
  	seats.each_slice(row_length)
  end

  def available_seats
  	seats.select(&:available?)
  end

  def create_seats(seat_count)
  	new_seats = []
  	event_id = self.id
  	seat_count.times do |counter|
  		new_seats << Seat.new(event_id: event_id, seat_number: (counter + 1))
  	end
  	self.seats = new_seats
  end

  def attendees_seat(user_id)
    self.seats.find_by_user_id(user_id)
  end
end
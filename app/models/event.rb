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
end
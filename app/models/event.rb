class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :seats
  has_and_belongs_to_many :attendees, join_table: "seats", class_name: "User"

end
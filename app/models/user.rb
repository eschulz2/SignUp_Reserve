class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, class_name: "Event",
                            foreign_key: "creator_id"
  has_many :seats
  has_and_belongs_to_many :attended_event, join_table: "seats", class_name: "Event"

  def name
    [self.first_name, self.last_name].compact.join(' ')
  end

  def current_seat(event_id)
    seats.where(event_id: event_id, user_id: current_user.id).first
  end

  def has_credits?
    credit > 0
  end
end

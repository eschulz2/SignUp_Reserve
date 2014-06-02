class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :seat_number
      
	  t.timestamps	
    end
  end
end

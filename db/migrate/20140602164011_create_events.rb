class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :datetime
      t.integer :creator_id

      t.timestamps	
    end
  end
end

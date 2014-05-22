class DropAdmin < ActiveRecord::Migration
  def up
    drop_table :admins
  end

  def down
    create_table :admin do |t|
      # t.string 

      t.timestamps        
    end
    add_index :tablenames, :anothertable_id
  end
end

class RemoveCreatePriviledgesFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :create_priviledges, :boolean, default: false
  end
end

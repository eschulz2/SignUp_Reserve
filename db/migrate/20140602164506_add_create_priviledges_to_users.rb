class AddCreatePriviledgesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :create_priviledges, :boolean, default: false
  end
end

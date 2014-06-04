class AddCreatePrivilegesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :create_privileges, :boolean, default: false
  end
end

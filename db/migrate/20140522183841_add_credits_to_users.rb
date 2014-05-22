class AddCreditsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit, :integer, default: 1

  end
end

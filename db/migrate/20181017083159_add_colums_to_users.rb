class AddColumsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :isactive, :boolean
  	add_column :users, :critical, :integer
  end
end

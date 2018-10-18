class ChangeAtributesInUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:users, :isactive, true)
  	change_column_default(:users, :critical, 4)
  end
end

class ChangeSomeAtributeInUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:users, :critical, 2)
  end
end

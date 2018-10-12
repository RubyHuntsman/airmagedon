class AddIndexToMeasurements < ActiveRecord::Migration[5.2]
  def change
  	add_index :measurements, :installation_id
  end
end

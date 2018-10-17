class AddColumnToMesurements < ActiveRecord::Migration[5.2]
  def change
  	add_column :measurements, :qi, :string
  end
end

class ChangeColumnTypeInMeasurements < ActiveRecord::Migration[5.2]
  def change
  	change_column :measurements, :qi, 'integer USING CAST(qi AS integer)'
  end
end

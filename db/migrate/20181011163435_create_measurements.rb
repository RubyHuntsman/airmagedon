class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.integer :pm10
      t.integer :pm25
      t.integer :pm1
      t.datetime :measured_at
      t.integer :installation_id

      t.timestamps
    end
  end
end

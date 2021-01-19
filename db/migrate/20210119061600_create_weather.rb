class CreateWeather < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :type
      t.datetime :datetime
      t.datetime :sunrise
      t.datetime :sunset
      t.float :temperature
      t.float :feels_like
      t.integer :humidity
      t.integer :uvi
      t.integer :visibility
      t.string :conditions
      t.string :icon
      t.float :max_temp
      t.float :min_temp
      t.string :wind_speed
      t.string :wind_direction

      t.timestamps
    end
  end
end

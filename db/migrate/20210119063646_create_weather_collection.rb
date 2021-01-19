class CreateWeatherCollection < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_collections do |t|
      t.timestamps
    end
  end
end

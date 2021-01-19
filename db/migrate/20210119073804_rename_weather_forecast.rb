class RenameWeatherForecast < ActiveRecord::Migration[5.2]
  def change
    rename_table :weather_collections, :forecasts
  end
end

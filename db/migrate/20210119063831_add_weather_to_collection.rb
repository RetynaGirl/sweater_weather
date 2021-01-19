class AddWeatherToCollection < ActiveRecord::Migration[5.2]
  def change
    add_reference :weathers, :weather_collections
  end
end

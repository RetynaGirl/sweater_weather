class ChangeWeatherCollectionsIdReference < ActiveRecord::Migration[5.2]
  def change
    change_table :weathers do |t|
      t.rename :weather_collections_id, :weather_collection_id
    end
  end
end

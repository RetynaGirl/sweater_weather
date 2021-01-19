class RenameCollectionId < ActiveRecord::Migration[5.2]
  def change
    change_table :weathers do |t|
      t.rename :weather_collection_id, :forecast_id
    end
  end
end

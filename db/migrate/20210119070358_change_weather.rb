class ChangeWeather < ActiveRecord::Migration[5.2]
  def change
    change_table :weathers do |t|
      t.rename :type, :forecast_type
    end
  end
end

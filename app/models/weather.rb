class Weather < ApplicationRecord
  belongs_to :forecast

  def current_serialize
    {
      datetime: datetime.localtime.to_s,
      sunrise: sunrise.localtime.to_s,
      sunset: sunset.localtime.to_s,
      temperature: temperature,
      feels_like: feels_like,
      humidity: humidity,
      uvi: uvi,
      visibility: visibility,
      conditions: conditions,
      icon: icon
    }
  end

  def daily_serialize
    {
      date: datetime.localtime.to_date.to_s,
      sunrise: sunrise.localtime.to_s,
      sunset: sunset.localtime.to_s,
      max_temp: max_temp,
      min_temp: min_temp,
      conditions: conditions,
      icon: icon
    }
  end

  def hourly_serialize
    {
      time: datetime.localtime.strftime('%T'),
      temperature: temperature,
      wind_speed: wind_speed,
      wind_direction: wind_direction,
      conditions: conditions,
      icon: icon
    }
  end
end

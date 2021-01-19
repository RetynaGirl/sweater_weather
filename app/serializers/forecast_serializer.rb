class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id nil

  attributes :current_weather do |forecast|
    forecast.current.current_serialize
  end

  attributes :daily_weather do |forecast|
    forecast.daily.map do |day|
      day.daily_serialize
    end
  end

  attributes :hourly_weather do |forecast|
    forecast.hourly.map do |hour|
      hour.hourly_serialize
    end
  end

end

class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_id nil

  attributes :destination_city,
             :travel_time

  attributes :forecast do |munchie|

    hours_after = (munchie.raw_travel_time / 3600).round

    then_weather = munchie.forecast.hourly[hours_after]
    {
      summary: then_weather.conditions,
      temperature: then_weather.temperature
    }
  end

  attributes :restaurant do |munchie|
    {
      name: munchie.restaurant_name,
      address: munchie.restaurant_address
    }
  end
end

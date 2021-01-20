class RoadtripSerializer
  include FastJsonapi::ObjectSerializer

  set_id nil

  attributes :start_city,
             :end_city

  attributes :travel_time do |road_trip|
    road_trip.travel_time_string
  end

  attributes :weather_at_eta do |road_trip|
    road_trip.weather_at_eta
  end
end

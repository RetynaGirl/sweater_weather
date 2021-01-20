class RoadTripFacade
  def self.get_trip(origin, destination)
    trip_data = MapService.trip(origin, destination)

  end
end

class MapFacade
  def self.get_coords(location)
    output = MapService.search(location)
    lat_lng = output[:results][0][:locations][0][:latLng]

    [lat_lng[:lat], lat_lng[:lng]]
  end
end

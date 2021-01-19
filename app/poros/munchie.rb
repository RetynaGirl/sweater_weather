class Munchie
  attr_reader :restaurant_name, :restaurant_address, :destination_city, :travel_time, :forecast, :raw_travel_time, :id

  def initialize(data)
    @id = nil
    @restaurant_name = data[:restaurant_name]
    @restaurant_address = data[:restaurant_address]
    @destination_city = data[:destination_city]
    @travel_time = data[:travel_time]
    @forecast = data[:forecast]
    @raw_travel_time = data[:raw_travel_time]
  end
end

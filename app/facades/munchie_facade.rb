class MunchieFacade
  def self.get_munchie(**params)
    businesses = BusinessService.businesses(location: params[:end], food: params[:food])

    businesses[:businesses].each do |business|
      route = MapService.get_route(
        start: params[:start],
        # end: address_clean(business[:location][:display_address]),
        street: business[:location][:address1],
        city: business[:location][:city],
        state: business[:location][:state]
      )

      business_details = BusinessService.details(business[:id])

      arrival_time = Time.now + route[:route][:realTime]
      arrival_2400 = arrival_time.strftime('%H%M').to_i

      days_after = (Time.now - arrival_time) / 86_400 # seconds in a day

      next unless arrival_2400.between?(business_details[:hours][0][:open][days_after][:start].to_i,
                                        business_details[:hours][0][:open][days_after][:end].to_i)

      lat_long = [route[:route][:locations].last[:latLng][:lat], route[:route][:locations].last[:latLng][:lng]]

      data = {
        restaurant_name: business_details[:name],
        restaurant_address: business_details[:location][:display_address].join(' '),
        destination_city: "#{business_details[:location][:city]}, #{business_details[:location][:state]}",
        travel_time: Time.strptime(route[:route][:realTime].to_s, '%s').utc.strftime('%k hours %M min'),
        forecast: WeatherFacade.get_weather(*lat_long),
        raw_travel_time: route[:route][:realTime]
      }

      return Munchie.new(data)
    end
  end

  def self.address_clean(address)
    "#{address.first}, #{address.last}"
  end
end

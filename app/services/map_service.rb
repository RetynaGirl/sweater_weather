class MapService
  def self.search(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params[:location] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(**params)
    locations = {
      locations: [
        {
          street: params[:start]
        },

        {
          street: params[:street],
          city: params[:city],
          state: params[:state]
        }
      ]
    }

    response = conn.get('directions/v2/route') do |req|
      # req.params[:from] = params[:start]
      # req.params[:to] = params[:end]

      req.body = locations.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.mapquestapi.com/') do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:inFormat] = 'kvp'
      req.params[:inFormat] = 'json'
      req.params[:thumbMaps] = false
    end
  end
end

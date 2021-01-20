class MapService
  def self.search(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params[:location] = location
    end

    output = JSON.parse(response.body, symbolize_names: true)

    raise ProjectError, output[:info][:messages].join(', ') if output[:info][:statuscode] == 400

    output
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

class BusinessService
  def self.businesses(**params)
    response = conn.get('v3/businesses/search') do |req|
      req.params[:location] = params[:location]
      req.params[:term] = params[:food]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(id)
    response = conn.get("v3/businesses/#{id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com/') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
    end
  end
end

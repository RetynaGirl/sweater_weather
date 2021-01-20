class ImageService
  def self.image(query)
    response = conn.get('search/photos') do |req|
      req.params[:query] = query
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com/') do |req|
      req.params[:per_page] = 1
      req.params[:content_filter] = 'high'
      req.params[:orientation] = 'landscape'
      req.headers[:Authorization] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
    end
  end
end

class Background
  attr_reader :image_location, :image_url, :image_credit_source, :image_credit_author, :logo, :id

  def initialize(data)
    @image_location = data[:image_location]
    @image_url = data[:image_url]
    @image_credit_source = data[:image_credit_source]
    @image_credit_author = data[:image_credit_author]
    @logo = data[:logo]
    @id = nil
  end
end

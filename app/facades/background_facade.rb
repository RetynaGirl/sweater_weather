class BackgroundFacade
  def self.get_background(location)
    background_data = ImageService.image("#{location} landscape")

    background = Background.new({
      image_location: location,
      image_url: background_data[:results][0][:urls][:raw],
      image_credit_source: background_data[:results][0][:user][:links][:html],
      image_credit_author: background_data[:results][0][:user][:username],
      logo: 'https://unsplash.com/assets/core/logo-black-df2168ed0c378fa5506b1816e75eb379d06cfcd0af01e07a2eb813ae9b5d7405.svg'
    })
  end
end

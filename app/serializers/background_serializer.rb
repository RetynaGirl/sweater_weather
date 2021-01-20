class BackgroundSerializer
  include FastJsonapi::ObjectSerializer

  set_id nil

  attributes :image do |background|
    {
      location: background.image_location,
      image_url: background.image_url,
      credit: {
        source: background.image_credit_source,
        author: background.image_credit_author,
        logo: background.logo
      }
    }
  end
end

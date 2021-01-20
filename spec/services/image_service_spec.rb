require 'rails_helper'

describe ImageService do
  xit 'image' do # Skipped to save api calls
    image_data = ImageService.image('cow')

    expect(image_data[:results].length).to eq 1
  end
end

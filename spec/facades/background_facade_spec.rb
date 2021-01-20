require 'rails_helper'

describe BackgroundFacade do
  it 'get_background' do # skipped to conserve api calls
    input = JSON.parse(IO.read('spec/fixtures/denver_image_return.json'), symbolize_names: true)

    allow(ImageService).to receive(:image).and_return(input)

    background = BackgroundFacade.get_background('denver,co')

    expect(background).to be_a Background
  end
end

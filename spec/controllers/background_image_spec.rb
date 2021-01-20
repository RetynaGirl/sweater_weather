require 'rails_helper'

describe Api::V1::BackgroundController, type: :controller do
  it 'background location call' do
    input = JSON.parse(IO.read('spec/fixtures/denver_image_return.json'), symbolize_names: true)

    allow(ImageService).to receive(:image).and_return(input)

    get :show, params: { location: 'denver,co' }

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:type]).to be_a String
    expect(output[:data][:id]).to eq nil
    expect(output[:data][:attributes]).to be_a Hash

    expect(output[:data][:attributes][:image]).to be_a Hash
    expect(output[:data][:attributes][:image][:location]).to be_a String
    expect(output[:data][:attributes][:image][:image_url]).to be_a String

    expect(output[:data][:attributes][:image][:credit]).to be_a Hash
    expect(output[:data][:attributes][:image][:credit][:source]).to be_a String
    expect(output[:data][:attributes][:image][:credit][:author]).to be_a String
    expect(output[:data][:attributes][:image][:credit][:logo]).to be_a String
  end
end

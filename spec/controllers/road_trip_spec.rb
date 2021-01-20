require 'rails_helper'

describe Api::V1::RoadTripController, type: :controller do
  it 'road trip happy' do

    user = User.create({
                         email: 'whatever@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         api_key: 'abcdefghij'
                       })

    content = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: 'abcdefghij'
    }

    post :create, params: content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:id]).to eq null
    expect(output[:data][:type]).to eq 'roadtrip'
    expect(output[:data][:attributes]).to be_a Hash

    expect(output[:data][:attributes][:start_city]).to be_a String
    expect(output[:data][:attributes][:end_city]).to be_a String
    expect(output[:data][:attributes][:travel_time]).to be_a String
    expect(output[:data][:attributes][:weather_at_eta]).to be_a Hash

    expect(output[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(output[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end
end

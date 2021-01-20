require 'rails_helper'

describe Api::V1::RoadtripController, type: :controller do
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
    expect(output[:data][:id]).to eq nil
    expect(output[:data][:type]).to eq 'roadtrip'
    expect(output[:data][:attributes]).to be_a Hash

    expect(output[:data][:attributes][:start_city]).to be_a String
    expect(output[:data][:attributes][:end_city]).to be_a String
    expect(output[:data][:attributes][:travel_time]).to be_a String
    expect(output[:data][:attributes][:weather_at_eta]).to be_a Hash

    expect(output[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(output[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it 'no route' do
    user = User.create({
                         email: 'whatever@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         api_key: 'abcdefghij'
                       })

    content = {
      origin: 'Denver,CO',
      destination: 'London, England',
      api_key: 'abcdefghij'
    }

    post :create, params: content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:id]).to eq nil
    expect(output[:data][:type]).to eq 'roadtrip'
    expect(output[:data][:attributes]).to be_a Hash

    expect(output[:data][:attributes][:start_city]).to be_a String
    expect(output[:data][:attributes][:end_city]).to be_a String
    expect(output[:data][:attributes][:travel_time]).to eq 'impossible route'
    expect(output[:data][:attributes][:weather_at_eta]).to eq nil
  end

  it 'bad api key' do
    user = User.create({
                         email: 'whatever@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         api_key: 'abcdefghij'
                       })

    content = {
      origin: 'Denver,CO',
      destination: 'London, England',
      api_key: 'nope'
    }

    post :create, params: content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to eq nil
    expect(output[:error]).to eq 'Bad api key'
    expect(response.status).to eq 400
  end
end

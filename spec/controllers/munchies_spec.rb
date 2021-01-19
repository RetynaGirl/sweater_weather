require 'rails_helper'

describe Api::V1::MunchiesController, type: :controller do
  it 'munchies request' do
    get :index, params: { start: 'denver,co', end: 'pueblo,co', food: 'chinese' }

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output).to be_a Hash

    data = output[:data]

    expect(data).to be_a Hash
    expect(data[:id]).to eq nil
    expect(data[:type]).to eq 'munchie'
    expect(data[:attributes]).to be_a Hash
    expect(data[:attributes][:destination_city]).to be_a String
    expect(data[:attributes][:travel_time]).to be_a String
    expect(data[:attributes][:forecast]).to be_a Hash
    expect(data[:attributes][:forecast][:summary]).to be_a String
    expect(data[:attributes][:forecast][:temperature]).to be_a String

    expect(data[:attributes][:restaurant]).to be_a Hash
    expect(data[:attributes][:restaurant][:name]).to be_a String
    expect(data[:attributes][:restaurant][:address]).to be_a String
  end
end

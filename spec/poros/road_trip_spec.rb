require 'rails_helper'

describe Roadtrip do
  it 'exists' do
    road_trip = Roadtrip.new({
                               start_city: 'Denver, CO',
                               end_city: 'Pueblo, CO',
                               travel_time: '1 hours 15 minutes',
                               forecast: 'supposed to be a forecast'
                             })

    expect(road_trip).to be_a Roadtrip
    expect(road_trip.start_city).to eq 'Denver, CO'
  end
end

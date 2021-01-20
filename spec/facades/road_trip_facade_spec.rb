require 'rails_helper'

describe RoadTripFacade do
  it 'get_trip' do
    origin = 'Denver, CO'
    destination = 'Pueblo, CO'

    trip_data = RoadTripFacade.get_trip(origin, destination)

    expect(trip_data[:route]).to be_a Hash
  end
end

require 'rails_helper'

describe RoadtripFacade do
  it 'get_trip' do
    origin = 'Denver, CO'
    destination = 'Pueblo, CO'

    trip = RoadtripFacade.get_trip(origin, destination)

    expect(trip).to be_a Roadtrip
  end
end

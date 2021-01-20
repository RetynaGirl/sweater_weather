require 'rails_helper'

describe MapService do
  describe 'class methods' do
    it 'search' do
      parsed_output = JSON.parse(IO.read('spec/fixtures/denver_map_return.json'), symbolize_names: true)

      location = 'denver,co'

      expect(MapService.search(location)).to eq(parsed_output)
    end

    it 'trip' do
      parsed_output = JSON.parse(IO.read('spec/fixtures/denver_pueblo_trip_return.json'), symbolize_names: true)

      start_location = 'Denver, CO'
      end_location = 'Pueblo, CO'

      expect(MapService.trip(start_location, end_location)).to eq(parsed_output)
    end
  end
end

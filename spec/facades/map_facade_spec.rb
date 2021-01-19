require 'rails_helper'

describe 'map_facade' do
  describe 'class methods' do
    it 'get_coords' do
      lat, long = 39.738453, -104.984853
      location = 'denver,co'

      expect(MapFacade.get_coords(location)).to eq([lat, long])
    end
  end
end

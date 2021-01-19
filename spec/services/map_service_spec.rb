require 'rails_helper'

describe MapService do
  describe 'class methods' do
    it 'search' do
      parsed_output = JSON.parse(IO.read('spec/fixtures/denver_map_return.json'), symbolize_keys: true)

      location = 'denver,co'

      expect(MapService.search(location)).to eq(parsed_output)
    end

  end
end

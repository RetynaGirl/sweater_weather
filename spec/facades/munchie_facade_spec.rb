require 'rails_helper'

describe MunchieFacade do
  it 'get_munchie' do
    params = { start: 'denver,co', end: 'pueblo,co', food: 'chinese' }

    expect(MunchieFacade.get_munchie(params)).to be_a Munchie
  end
end

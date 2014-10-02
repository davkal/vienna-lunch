require 'rails_helper'
require 'restaurants_helper'

describe ViennaLunch::Restaurants::Figar do
  it 'should have todays lunch' do
    expect(ViennaLunch::Restaurants::Figar::lunch(resource('figar.json'))).to match(/(heute|kochen|gibt)/i)
  end
end

require 'rails_helper'
#require 'vienna_lunch/restaurants/figar'

describe ViennaLunch::Restaurants::Figar do
  it 'should have todays lunch' do
    expect(ViennaLunch::Restaurants::Figar::lunch).to match(/(heute|kochen|gibt)/i)
  end
end

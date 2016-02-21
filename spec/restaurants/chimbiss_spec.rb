require 'rails_helper'

  describe ViennaLunch::Restaurants::Chimbiss do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Chimbiss::lunch
    expect(@lunch).to match(/(tag|woch)/i)
  end
end

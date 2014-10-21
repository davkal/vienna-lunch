require 'rails_helper'

  describe ViennaLunch::Restaurants::CoteSud do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::CoteSud::lunch
    expect(@lunch).to include("1)")
    expect(@lunch).to include("2)")
  end
end

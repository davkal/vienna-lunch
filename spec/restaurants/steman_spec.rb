require 'rails_helper'

  describe ViennaLunch::Restaurants::Steman do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Steman::lunch
    expect(@lunch).to match(/Hauptspeise/i)
    expect(@lunch).to match(/mit/i)
  end
end

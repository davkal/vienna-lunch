require 'rails_helper'

  describe ViennaLunch::Restaurants::Podium do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Podium::lunch
    expect(@lunch).to match(/fleisch/i)
    expect(@lunch).to match(/vegetarisch/i)
  end
end

require 'rails_helper'

  describe ViennaLunch::Restaurants::Salzberg do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Salzberg::lunch
    expect(@lunch).to match(/Tagesteller/i)
  end
end

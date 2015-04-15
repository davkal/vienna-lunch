require 'rails_helper'

  describe ViennaLunch::Restaurants::Wirr do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Wirr::lunch
    expect(@lunch).to match(/II /i)
    expect(@lunch).to match(/- /i)
  end
end

require 'rails_helper'

  describe ViennaLunch::Restaurants::Woracziczky do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Woracziczky::lunch
    expect(@lunch).to match(/(menü|heut|mittag)/i)
  end
end

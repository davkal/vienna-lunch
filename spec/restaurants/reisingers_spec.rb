require 'rails_helper'

  describe ViennaLunch::Restaurants::Reisingers do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Reisingers::lunch
    expect(@lunch).to match(/(montag|dienstag|mittwoch|donnerstag|freitag)/i)
  end
end

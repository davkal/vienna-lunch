require 'rails_helper'

  describe ViennaLunch::Restaurants::Figar do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Figar::lunch
    expect(@lunch).to match(/(heut|kochen|gibt|montag|dienstag|mittwoch|donnerstag|freitag)/i)
    expect(@lunch).to include('href="https://www.facebook')
  end
end

require 'rails_helper'

  describe ViennaLunch::Restaurants::VictusUndMili do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::VictusUndMili::lunch
    expect(@lunch).not_to be_empty
  end
end

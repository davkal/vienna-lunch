require 'rails_helper'

TEST_RESOURCE = JSON.load(open(File.expand_path('spec/restaurants/support/figar.txt')))

describe ViennaLunch::Restaurants::Figar do
  it 'should have todays lunch' do
    expect(ViennaLunch::Restaurants::Figar::lunch(TEST_RESOURCE)).to match(/(heute|kochen|gibt)/i)
  end
end

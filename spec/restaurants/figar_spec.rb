require 'rails_helper'
require 'restaurants_helper'

describe ViennaLunch::Restaurants::Figar do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::Figar::lunch(resource('figar.json'))
    expect(@lunch).to match(/(heute|kochen|gibt)/i)
    expect(@lunch).to include('href="https://www.facebook')
  end
end

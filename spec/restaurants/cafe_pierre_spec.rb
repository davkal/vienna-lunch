require 'rails_helper'

describe ViennaLunch::Restaurants::CafePierre do
  it 'should have todays lunch' do
    @lunch = ViennaLunch::Restaurants::CafePierre::lunch
    puts @lunch
    expect(@lunch).to match(/1.\)/)
    expect(@lunch).to match(/2.\)/)
    expect(@lunch).to match(/3.\)/)
    expect(@lunch).to match(/4.\)/)
    expect(@lunch).to match(/5.\)/)
    expect(@lunch).to match(/6.\)/)
  end
end

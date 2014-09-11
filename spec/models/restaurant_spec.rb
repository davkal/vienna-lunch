require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  before do
    @restaurant = Restaurant.new(name: "Wirr")
  end

  subject { @restaurant }

  describe "when name is not present" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end
end

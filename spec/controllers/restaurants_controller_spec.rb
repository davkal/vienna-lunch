require 'rails_helper'

RSpec.describe RestaurantsController, :type => :controller do
  it 'sends list of restaurants' do
    get 'index'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(1)
  end
end

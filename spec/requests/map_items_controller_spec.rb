require 'rails_helper'

RSpec.describe MapItemsController, type: :controller do
  describe "GET #index" do
    before do
      FactoryBot.create(:map_item)
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "contains the map item and associated attributes in JSON" do
      json_response = JSON.parse response.body
      expect(json_response.first.keys).to match_array([
        "leader", "league", "size"
      ])
    end
  end
end

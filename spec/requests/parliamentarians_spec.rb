require 'rails_helper'

RSpec.describe "Parliamentarians", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get parliamentarians_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show/:id" do
    it "returns http success" do
      parliamentarian = create(:parliamentarian)
      create(:expense, parliamentarian: parliamentarian)
      get parliamentarian_path(id: parliamentarian.id)
      expect(response).to have_http_status(:success)
    end
  end

end

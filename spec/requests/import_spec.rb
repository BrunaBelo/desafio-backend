require 'rails_helper'

RSpec.describe "Imports", type: :request do
  describe "POST /import_csv" do
    it "returns http success" do
      post import_csv_path
      expect(response).to have_http_status(:success)
    end
  end

end

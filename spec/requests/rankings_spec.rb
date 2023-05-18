require 'rails_helper'

RSpec.describe "Rankings", type: :request do
  describe "GET /actual" do
    it "returns http success" do
      get "/rankings/actual"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /record" do
    it "returns http success" do
      get "/rankings/record"
      expect(response).to have_http_status(:success)
    end
  end

end

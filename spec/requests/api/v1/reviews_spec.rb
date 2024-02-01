require 'rails_helper'

RSpec.describe "Api::V1::Reviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/reviews"

      expect(response.body).to eq("{\"data\":[]}")

      expect(response.status).to eq(200)
    end
  end
end

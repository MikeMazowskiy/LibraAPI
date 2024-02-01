require 'rails_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/books"

      expect(response.body).to eq('{"status":"online"}')

      expect(response.status).to eq(200)
    end
  end
end

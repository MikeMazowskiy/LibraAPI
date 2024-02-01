require "rails_helper"

RSpec.describe "Api::V1::Profiles", type: :request do
  describe "GET /api/v1/profiles" do
    it "returns http success" do
      get "/api/v1/profiles"

      expect(response.body).to eq("{\"data\":[]}")

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/profile" do
    let!(:profile) { create(:profile) }

    it "returns http success" do
      get "/api/v1/profiles/#{profile.id}"

      expect(response.body).to eq(ProfileSerializer.new(profile).to_json)

      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/profiles" do
    let(:user) { create(:user) }

    scenario "valid profile attributes" do

      post "/api/v1/profiles", params: {
        profile: {
          nick_name: "Nick_name",
          full_name: "Full name",
          age: 19,
          user_id: user.id,
          author: false,
        }
      }

      json_data = JSON.parse(response.body).deep_symbolize_keys[:data][:attributes]

      expect(json_data[:age]).to eq(19)
      expect(json_data[:nick_name]).to eq("Nick_name")

      expect(Profile.count).to eq(1)

      expect(Profile.last.nick_name).to eq("Nick_name")
    end
  end

  scenario "invalid profile attributes" do

    post "/api/v1/profiles", params: {
      profile: {
        nick_name: "Nick_name",
        full_name: "Full name",
        age: 19,
        author: false,
      }
    }

    json_data = JSON.parse(response.body).deep_symbolize_keys

    expect(json_data[:errors][0][:title]).to eq("User must exist")
    expect(response.status).to eq(422)
  end

  describe "PUT /api/v1/profile" do
    let!(:profile) { create(:profile, nick_name: "NN", age: 11) }

    scenario "valid profile attributes" do
      put "/api/v1/profiles/#{profile.id}", params: {
        profile: {
          nick_name: "Nick",
          age: 20
        }
      }

      expect(response.status).to eq(200)

      json_data = JSON.parse(response.body).deep_symbolize_keys[:data][:attributes]
      expect(json_data[:nick_name]).to eq("Nick")
      expect(json_data[:age]).to eq(20)

      expect { profile.reload }.to change{ profile.nick_name }.from("NN").to("Nick")
      expect(profile.reload.age).to eq(20)
    end
  end

  describe "DELETE api/v1/profile/destroy" do
    let!(:profile) { create(:profile) }

    before { delete "/api/v1/profiles/#{profile.id}" }

    scenario "delete profile" do
      expect(response.status).to eq(200)

      expect(Profile.count).to eq(0)
    end
  end
end

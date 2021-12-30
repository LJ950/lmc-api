require 'rails_helper'

RSpec.describe 'Api::V1::Meets', type: :request do
  describe 'GET /meets' do
    let!(:meet) { create_list(:meet, 2) }
    before :each do
      get '/api/v1/meets'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns all meets with the correct properties' do
      expect(JSON.parse(response.body).size).to eq(2)
      expect(response.body).to include([meet.first, meet.second].to_json)
    end
  end

  describe 'GET /meets/:id' do
    let!(:meet) { create(:meet) }
    before :each do
      get '/api/v1/meets', params: { id: meet.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns the correct meet' do
      expect(response.body).to eq([meet].to_json)
    end
  end
end

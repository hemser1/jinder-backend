# frozen_string_literal: true

require 'faker'
require 'rails_helper'

RSpec.describe Api::SessionsController, type: :request do
  before do
    post '/users', params: { "user": { :email => "david@smith.com",
          :password => "123456", } }
  end
  describe 'POST #create' do
    it 'returns 200 created' do
      expect(response).to have_http_status(:created)
    end
    it 'returns email address' do
      expect(JSON.parse(response.body)['email']). to eq ('david@smith.com')
    end
    it 'returns auth token' do
      expect(JSON.parse(response.body)['authentication_token']).to be_truthy
    end
  end
  # describe 'GET #show' do
  #   it 'returns all users' do
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
  # describe 'DELETE #destroy' do
  #   it 'destroys sessions!' do
  #   auth = JSON.parse(response.body)['authentication_token']
  #   email = 'david@smith.com'
  #     delete '/api/sessions', headers: {:'X-User-Email' => email, :'X-User-Token' => auth}
  #       expect(response).to have_http_status(:ok)
  #   end
  # end

  #
  #   it "should get new session" do
  #     get '/login'
  #     assert_response :success
  #   end
  #
end

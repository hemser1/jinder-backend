# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do

  before do
    post '/employers', params: {
          "employer": {
            :first_name => "Alan",
            :last_name => "Sugar",
            :email => "alan@sugar.com",
            :password => "123456",
            :location => "London",
            :bio => "I run Amstrad",
            :company_url => "www.alan.com"
               }}
   post '/users', params: { "user": { :email => "david@smith.com",
         :password => "123456", } }
  end
  describe "#Create" do
    it 'returns 200 created' do
      expect(response).to have_http_status(:created)
    end
    it 'returns json with email' do
      expect(JSON.parse(response.body)['email']). to eq ('david@smith.com')
    end
  end
  describe "#Delete" do
    it 'deletes employer' do
      delete '/users'
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "#Show" do
    it 'should show all employers' do
      get '/users'
    expect(JSON.parse(response.body).first['email']).to eq ('david@smith.com')
    end
  end
  describe "#UpdateMatches" do
    it 'should return 201 created adding matches to db' do
      patch '/users/update_matches', params: {
        id: 22,
        accepted_employers: 18,
        rejected_employers: 2
      }
      expect(response).to have_http_status(:created)
    end
  end
  describe "#ShowMatches" do
    it "should return a json with matched profiles" do
      patch '/users/update_matches', params: {
        id: 23,
        accepted_employers: 19,
        rejected_employers: 1
      }
      patch '/employers/update_matches', params: {
        id: 19,
        accepted_profiles: 23,
        rejected_profiles: 1
      }
    get "/users/show_matches"
      expect(JSON.parse(response.body).first['email']).to eq("alan@sugar.com")
    end
  end
  describe "#Show specific user" do
    it "should return a specific user depending on ID" do
      get "/users/24"
    expect(JSON.parse(response.body)["email"]).to eq("david@smith.com")
    end
  end
end

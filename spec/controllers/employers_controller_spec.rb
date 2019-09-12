# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployersController, type: :request do

  before do
    post '/users', params: { "user": { :email => "david@smith.com",
          :password => "123456", } }
    post '/api/profiles', params: {	"profile": {
    		:first_name => "zi2",
    		:last_name => "warriorprincess",
    		:industry => "software",
    		:user_id => 6,
    		:skills => "input"
    	}}
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
  end
  describe "#Create" do
    it 'returns 200 created' do
      expect(response).to have_http_status(:created)
    end
    it 'returns json with email' do
      expect(JSON.parse(response.body)['email']). to eq ('alan@sugar.com')
    end
  end
  describe "#Delete" do
    it 'deletes employer' do
      delete '/employers'
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "#Show" do
    it 'should show all employers' do
      get '/employers'
    expect(JSON.parse(response.body).first['email']).to eq ('alan@sugar.com')
    end
  end
  describe "#UpdateMatches" do
    it 'should return 201 created adding matches to db' do
      patch '/employers/update_matches', params: {
        id: 5,
        accepted_profiles: 6,
        rejected_profiles: 2
      }
      expect(response).to have_http_status(:created)
    end
  end
  describe "#ShowMatches" do
    it "should return a json with matched profiles" do
      patch '/employers/update_matches', params: {
        id: 6,
        accepted_profiles: 6,
        rejected_profiles: 1
      }
      patch '/users/update_matches', params: {
        id: 6,
        accepted_employers: 6,
        rejected_employers: 1
      }
    get "/employers/show_matches"
      expect(JSON.parse(response.body).first['email']).to eq("david@smith.com")
    end
  end
  describe "#Show specific user" do
    it "should return a specific user depending on ID" do
      get "/employers/7"
    expect(JSON.parse(response.body)["email"]).to eq("alan@sugar.com")
    end
  end
end

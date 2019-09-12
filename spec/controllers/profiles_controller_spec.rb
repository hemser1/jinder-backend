# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProfilesController < ApplicationController, type: :request do
  before do
    post '/users', params: { "user": { :email => "david@smith.com",
          :password => "123456", } }

  end

  describe "#Create" do
    it "returns 200 Created when creating profile" do
      post '/api/profiles', params: { "profile": {
        :first_name => "David",
        :last_name => "Smith",
        :user_id => 8,
        :user_bio => "this is my bio",
        :industry => "Software Engineering",
        :location => "London",
        :skills => "Rails Testing",
        :personality => "Funny",
      }}
      expect(response).to have_http_status(:ok)
    end
    it "returns 422 unprocessable_entity when inputting incorrectly" do
      post '/api/profiles', params: { "profile": {
        :first_name => "David",
        :last_name => "Smith",
        :user_id => 8,
        :user_bio => "this is my bio",
        :industry => "Software Engineering",
        :location => "London",
        :skills => "Rails Testing",
        :personality => "Funny",
      }}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe "#Show all profiles" do
    it "should return all profiles" do
      post '/api/profiles', params: { "profile": {
        :first_name => "David",
        :last_name => "Smith",
        :user_id => 10,
        :user_bio => "this is my bio",
        :industry => "Software Engineering",
        :location => "London",
        :skills => "Rails Testing",
        :personality => "Funny",
      }}
      get '/api/profiles'
      expect(JSON.parse(response.body).first['first_name']).to eq ("David")
    end
  end
  describe "#Shows specific profiles" do
    it "should return a single profile profiles" do
      post '/api/profiles', params: { "profile": {
        :first_name => "David",
        :last_name => "Smith",
        :user_id => 11,
        :user_bio => "this is my bio",
        :industry => "Software Engineering",
        :location => "London",
        :skills => "Rails Testing",
        :personality => "Funny",
      }}
      get '/api/profiles/11'
      expect(JSON.parse(response.body).first['first_name']).to eq ("David")
    end
  end
end

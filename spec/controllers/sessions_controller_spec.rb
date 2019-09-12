# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SessionsController < ApplicationController, type: :request do
before do
  post '/users', params: { "user": { :email => "david@smith.com",
        :password => "123456", } }
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

  describe '#create' do
    it 'returns 200 created' do
      post '/api/sessions', params: { :email => "david@smith.com",
            :password => "123456", }
      expect(response).to have_http_status(:created)
    end
    it 'returns employer depending on email' do
      post '/api/sessions', params: { :email => "alan@sugar.com",
            :password => "123456", }
      expect(JSON.parse(response.body)['email']). to eq ('alan@sugar.com')
    end
    it 'throws unprocessable_entity if password not correct' do
      post '/api/sessions', params: { :email => "david@smith.com",
            :password => "12345", }
            expect(response).to have_http_status(:unauthorized)
    end
    it 'created new session if password correct' do
      post '/api/sessions', params: { :email => "david@smith.com",
            :password => "123456", }
            expect(response).to have_http_status(:created)
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys user sessions!' do
      delete '/api/sessions', params: { email: "david@smith.com"}
        expect(response).to have_http_status(:no_content)
    end
    it 'destroys employer sessions!' do
      delete '/api/sessions', params: { email: "alan@sugar.com"}
        expect(response).to have_http_status(:no_content)
    end
  end

end

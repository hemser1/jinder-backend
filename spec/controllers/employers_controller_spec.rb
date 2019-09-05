# frozen_string_literal: true

require 'faker'
require 'rails_helper'

RSpec.describe EmployersController, type: :request do

  before do
    post '/employers', params: { "employer": {
      :first_name => "David",
      :last_name => "Smith",
      :email => "david@smith.com",
      :password => "123456",
      :bio => "CTO of amazing start up",
      :company_url => "www.amazing-start-up.com"
    }
  }
  end

  it 'returns 200 created' do
    expect(response).to have_http_status(:created)
  end
  it 'returns json with email' do
    expect(JSON.parse(response.body)['email']). to eq ('david@smith.com')
  end
  # it 'deletes employer' do
  #   delete '/employers', params: { :id => 1 }
  #   expect(response).to have_http_status(:ok)
  # end
end

require 'rails_helper'

RSpec.describe "Issues", type: :request do
  describe 'GET /followeds/:spotify_token' do
    it '200 Ok' do            
      get '/followeds/abcdf'
      expect(response).to have_http_status(200)
    end
  end
end

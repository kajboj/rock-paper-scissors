require_relative '../web'

require 'pry'
require 'rack/test'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  specify 'GET /move' do
    get '/move'
    last_response.body.should == 'SCISSORS'
  end

  specify 'POST /move' do
    post '/move'
    last_response.status.should == 200
  end

  specify 'POST /start' do
    post '/start'
    last_response.status.should == 200
  end
end
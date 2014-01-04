require_relative '../web'

require 'pry'
require 'rack/test'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  specify do
    get '/'
    last_response.body.should =~ /Hello/
  end
end
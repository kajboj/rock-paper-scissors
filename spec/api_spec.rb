require_relative '../web'

require 'pry'
require 'rack/test'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before do
    Bot.stub(:start)
    Bot.stub(:move)
    Bot.stub(:opponent_move)
  end

  describe 'POST /start' do
    let(:params) do
      {
        'opponentName'  => 'opponent name',
        'pointsToWin'   => 'points to win',
        'maxRounds'     => 'max rounds',
        'dynamiteCount' => 'dynamite count'
      }
    end

    it 'succeeds' do
      post '/start', params
      last_response.status.should == 200
    end

    it 'tells bot about new match starting' do
      Bot.should_receive(:start).with(params)
      post '/start', params
    end
  end

  describe 'GET /move' do
    it 'succeeds' do
      get '/move'
      last_response.status.should == 200
    end

    it 'asks bot for the next move and returns it' do
      Bot.should_receive(:move).and_return('some move')
      get '/move'
      last_response.body.should == 'some move'
    end
  end

  describe 'POST /move' do
    it 'succeeds' do
      post '/move', {'lastOpponentMove' => 'some move'}
      last_response.status.should == 200
    end

    it 'tells bot about opponent move' do
      Bot.should_receive(:opponent_move).with('some move')
      post '/move', {'lastOpponentMove' => 'some move'}
    end
  end
end
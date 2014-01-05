require_relative '../web'

require 'pry'
require 'rack/test'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'POST /start' do
    let(:params) do
      {
        'opponentName'  => 'opponent name',
        'pointsToWin'   => '1',
        'maxRounds'     => '2',
        'dynamiteCount' => '1'
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
      post '/move', {'lastOpponentMove' => 'PAPER'}
      last_response.status.should == 200
    end

    it 'tells bot about opponent move' do
      Bot.should_receive(:opponent_move).with('some move')
      post '/move', {'lastOpponentMove' => 'some move'}
    end
  end

  describe 'GET /log' do
    it 'succeeds' do
      get '/log'
      last_response.status.should == 200
    end

    it 'returns some moves from the past' do
      get '/log'
      last_response.body.should =~ //
    end
  end
end
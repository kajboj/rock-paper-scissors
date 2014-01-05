require 'sinatra'
require './bot'

get '/move' do
  move = Bot.move
  move
end

post '/move' do
  opponent_move = params['lastOpponentMove']
  Bot.opponent_move(opponent_move)
  nil
end

post '/start' do
  Bot.start(params)
  nil
end
require 'sinatra'
require './bot'

get '/move' do
  Bot.move
end

post '/move' do
  Bot.opponent_move
  nil
end

post '/start' do
  Bot.start(params)
  nil
end
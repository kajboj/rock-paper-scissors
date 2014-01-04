require 'sinatra'
require './bot'

get '/move' do
  Bot.move
end

post '/move' do
  Bot.opponent_move
end

post '/start' do
  Bot.start(params)
end
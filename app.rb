require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names'do
    $game = Game.new(Player.new(params[:first_player]), Player.new(params[:second_player]))
    redirect '/play'
  end

  get '/play' do
    @first_player = $game.first_player
    @second_player = $game.second_player
    erb :play
  end

  post '/attack' do
    $game.attack($game.opponent)
    $game.switch_player
    if $game.game_over? == false
      redirect '/attack'
    else
      redirect '/game_over'
    end
  end

  get '/attack' do
    @first_player = $game.first_player
    @second_player = $game.second_player
    erb :attack
  end

  get '/game_over' do
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require 'player.rb'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names'do
    $first_player = Player.new(params[:first_player])
    $second_player = Player.new(params[:second_player])
    redirect '/play'
  end

  get '/play' do
    @first_player = $first_player.name
    @second_player = $second_player.name
    @hp = $second_player.hp
    erb :play
  end

  get '/attack' do
    @first_player = $first_player.name
    @second_player = $second_player.name
    $second_player.attack
    @hp = $second_player.hp
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

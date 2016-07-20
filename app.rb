require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names'do
    session[:first_player] = params[:first_player]
    session[:second_player] = params[:second_player]
    redirect '/play'
  end

  get '/play' do
    @first_player = session[:first_player]
    @second_player = session[:second_player]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

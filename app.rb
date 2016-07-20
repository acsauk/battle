require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/names'do
    @first_player = params[:first_player]
    @second_player = params[:second_player]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

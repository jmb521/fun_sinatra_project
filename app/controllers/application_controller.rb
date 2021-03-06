require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "12345"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      
      @user = User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
    
    def allowed_to_edit(user)
      if current_user != user
        redirect "/cards"
      end
    end
  end
  


end

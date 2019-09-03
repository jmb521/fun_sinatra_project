class SessionsController < ApplicationController


  # GET: /sessions/new
  #login page
  get "/login" do

    erb :"/sessions/new.html"
  end

  # POST: /sessions
  post "/login" do
    if params[:username] == "" || params[:password] == ""
      redirect '/login'
    else
      @user = User.find_by(:email => params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect '/cards'
      else
        redirect '/login'
      end
    end
    
  end

  # GET: /sessions/5
  # get "/sessions/:id" do
  #   erb :"/sessions/show.html"
  # end



  # DELETE: /sessions/5/delete
  get "/logout" do
    session.destroy
    redirect "/"
  end
end

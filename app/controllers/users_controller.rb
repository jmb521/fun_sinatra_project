class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end
  
  #signup page
  get "/signup" do
    
    erb :"/users/new.html"
  end
  
  # POST: /users
  post "/users" do
    
    @user = User.find_by(:email => params[:user][:email]) || User.find_by(:username => params[:user][:username])
    if @user
      
      redirect '/login'
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      
      redirect "/users/#{@user.id}"
    end
  end
  
  # GET: /users/5
  get "/users/:id" do
    
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end
  
  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end

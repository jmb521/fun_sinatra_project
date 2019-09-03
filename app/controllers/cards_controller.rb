class CardsController < ApplicationController

  # GET: /cards
  get "/cards" do
    
    @cards = Card.all
    erb :"/cards/index.html"
  end
  
  # GET: /cards/new
  get "/cards/new" do
    if logged_in? 
      erb :"/cards/new.html"
      
    else
      redirect '/cards'
    end
  end
  
  # POST: /cards
  post "/cards" do
    
    if params[:player_name] != "" 
      
      @card = Card.create(params[:card])
      binding.pry
       @card = Card.new(player_name: params[:card][:player_name], team: params[:card][:team], number: params[:card][:number], year: params[:card][:year], user_id: current_user.id, :condition => params[:card][:condition])
      # @card.user = current_user
      # @card.save
    end
    # redirect "/cards"
  # end
  redirect "/cards/#{@card.id}"
  end

  # GET: /cards/5
  get "/cards/:id" do
    @card = Card.find(params[:id])
    erb :"/cards/show.html"
  end

  # GET: /cards/5/edit
  get "/cards/:id/edit" do
    @card = Card.find(params[:id])
    
    if @card.user == current_user
    # allowed_to_edit(@card.user)
      erb :"/cards/edit.html"
    else
      redirect '/cards'
    end
    
  end

  # PATCH: /cards/5
  patch "/cards/:id" do

    @card = Card.find(params[:id])
    allowed_to_edit(@card.user)
    @card.update(params[:card])
    redirect "/cards/#{@card.id}"
  end

  # DELETE: /cards/5/delete
  delete "/cards/:id/delete" do
    @card = Card.find(params[:id])
    allowed_to_edit(@card.user)
    @card.destroy
    redirect "/cards"
  end
end

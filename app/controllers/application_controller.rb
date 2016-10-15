require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end

  # get '/recipes/new/' do 
  #   erb :new
  # end 

  get '/recipes/new' do 
    erb :new
  end 
  #testing is dumb

  get '/recipes' do 
    #{}"Hello World"
    @recipes = Recipe.all 
    erb :index
  end 
  #testing is dumb


  get '/recipes/' do 
    #{}"Hello World"
    @recipes = Recipe.all 
    erb :index
  end 



  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 


  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end 

  post '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end



  # post '/recipes/' do 
  #   @recipe = Recipe.create(params)
  #   #binding.pry
  #   redirect to '/recipes/#{@recipe.id}/'
  # end 

  post '/recipes' do 
    @recipe = Recipe.create(params)
    #binding.pry
    redirect to "/recipes/#{@recipe.id}/"
  end 

  # get '/recipes/:id/' do 
  #   @recipe = Recipe.find_by_id(params[:id])
  #   erb :show
  # end 


  #testing is dumb

  # get '/recipes/:id/edit/' do 
  #   @recipe = Recipe.find_by_id(params[:id])
  #   erb :edit
  # end 

  # patch '/recipes/:id/' do
  #   @recipe = Recipe.find_by_id(params[:id])
  #   @recipe.name = params[:name]
  #   @recipe.ingredients = params[:ingredients]
  #   @recipe.cook_time = params[:cook_time] 
  #   @recipe.save
  #   redirect to "/recipes/#{@recipe.id}/"
  # end   

  # delete '/recipes/:id/delete/' do
  #   @recipe = Recipe.find_by_id(params[:id])
  #   @thing = @recipe.name
  #   @recipe.delete
  #   redirect to 'recipes'
  # end 

  post '/recipes/:id/delete' do
    Recipe.destroy(params[:id])
    erb :index
  end 

end
get '/' do

  erb :index

end


get '/my_recipes' do
  #list all saved recipes
  @recipes = Recipe.all
  erb :index
end

post '/search_recipe' do
   @first_ten = Yummly::Client.recipes(params[:ingredients_search])
   search_results = erb :search, :layout => false
   content_type :json
   {results_html: search_results}.to_json
end

# post '/search_recipes' do
#   api = Yummly::Client.new(params)
#   api.recipes
# end

# if @method == "delete" || @method == "edit"
#    @recipe = Recipe.find params[:id]
# end
#   erb :index
# end

# post '/recipes' do
#   p params
#   @recipe = Recipe.new
#   @recipe.title = params[:title]
#   @recipe.content = params[:content]
#   @recipe.save
#   redirect '/'
# end

# get '/recipes/:id' do
#   @recipe = Recipe.find params[:id]
#   @recipe.title = params[:title]
#   @recipe.content = params[:content]
#   @recipe.save
#   redirect '/'
# end

# delete '/recipes/:id' do
#   @recipe = Recipe.find params[:id]
#   @recipe.destroy
#   redirect '/'
# end

# put '/recipes/:id' do
#   @recipe = Recipe.find params[:id]
#   @recipe.update_attributes(title: params[:title], content: params[:content])
#   redirect '/'
# end


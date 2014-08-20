get '/' do

  erb :index

end

get '/my_recipes' do
  #list all recipes
  @recipes = Recipe.all
  erb :index
end

#doesn't work as a get route. why?
post '/search_recipe' do
   search_results = HTTParty.get("http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}&allowedIngredient[]=#{params[:ingredients_search]}")
   # search_results = JSON.parse(search_results.body)
   # search_results["matches"][]["ingredients"]
   # content_type :json
   search_results = JSON.parse(search_results.body)
   @first_ten = search_results["matches"].take(10)
   erb :search

   # recipe_parsed = {search_results["matches"][0]["recipeName"] => search_results["matches"][0]["ingredients"]}.to_json


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


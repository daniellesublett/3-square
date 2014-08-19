APP_KEY = ''
APP_ID = ''

get '/' do
# @recipes = Recipe.all
# @method = params[:method]
#   # TODO get dotenv gem to hide api keys.

# result = Yummly.search('Onion soup')
# result.total # returns 43350
# result.size # returns 10
# result.collect { |recipe| recipe.name }

# p result
erb :index
end

post '/search_recipe' do
  #need to interpolate spaces in the ingredients gsub + for spaces.
  search_results = HTTParty.get("http://api.yummly.com/v1/api/recipes?_app_id=#{APP_ID}&_app_key=#{APP_KEY}&#{params[:ingredients_search]}")
  pp search_results
end

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


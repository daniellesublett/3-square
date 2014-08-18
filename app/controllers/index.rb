get '/' do
  # @recipes = Recipe.all
  @method = params[:method]
  # TODO get dotenv gem to hide api keys.
  # search_results = HTTParty.get('http://api.yummly.com/v1/api/recipes?_app_id=XXXXfef5&_app_key=XXXXX&vegetarian')
  debugger
  if @method == "delete" || @method == "edit"
     @recipe = Recipe.find params[:id]
  end
  erb :index
end

post '/recipes' do
  p params
  @recipe = Recipe.new
  @recipe.title = params[:title]
  @recipe.content = params[:content]
  @recipe.save
  redirect '/'
end

get '/recipes/:id' do
  @recipe = Recipe.find params[:id]
  @recipe.title = params[:title]
  @recipe.content = params[:content]
  @recipe.save
  redirect '/'
end

delete '/recipes/:id' do
  @recipe = Recipe.find params[:id]
  @recipe.destroy
  redirect '/'
end

put '/recipes/:id' do
  @recipe = Recipe.find params[:id]
  @recipe.update_attributes(title: params[:title], content: params[:content])
  redirect '/'
end


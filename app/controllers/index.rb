require 'pp'
  get '/' do
  erb :index
end


post '/search_recipe' do
   @first_ten = Yummly::Client.recipes(params[:ingredients_search])
   search_results = erb :search, :layout => false
   content_type :json
   {results_html: search_results}.to_json

end

post '/recipe_save' do
  name = params[:recipeName]
  ingredients = params[:ingredients]
  image_link = params[:image]
  recipe = Recipe.create(recipe_name: name, image_link: image_link)
  ingredient_hashes = ingredients.map do |ingredient_name|
    { name: ingredient_name }
  end
  recipe.ingredients.build(ingredient_hashes)
  recipe.save!
  redirect '/saved_recipes'
end

get '/saved_recipes' do
  @recipes = Recipe.all
  erb :saved_recipes
end

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


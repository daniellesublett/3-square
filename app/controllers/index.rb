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
   p @name = params[:recipeName]
   p @ingredients = params[:ingredients]
   p @image_link = params[:image]
   Recipe.create(recipe_name: @name, image_link: @image_link)
  erb :menu
end

get '/shopping_list' do

  erb :shopping_list
end


get '/menu' do
  @recipes = Recipe.all
  erb :menu

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


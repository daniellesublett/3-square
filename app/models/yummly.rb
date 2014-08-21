module Yummly
  class Client
    include HTTParty
    base_uri "http://api.yummly.com/v1/api"

    #get basic ingredients list
    def self.recipes(ingredients_search)
      api_uri = "/recipes?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}&allowedIngredient[]=#{ingredients_search}"
      search_results = self.get(api_uri)
      search_results = JSON.parse(search_results.body)
      search_results["matches"].take(10)
    end

    # first_ten = self.recipes(ingredients_search)

    #get comlete recipe object and images
    # def self.get_full_recipe(first_ten)
    #     first_ten.each do |recipe|
    #     @search_result_array = []
    #     api_uri = "/api/recipe/#{@recipe_id}?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}"
    #     @search_result_array << api_uri
    #   end
    #    @search_result_array.each do |recipe|
    #     response = self.get(api_uri)
    #     search_results = JSON.parse(search_results.body)
    #     search_results["images"].take(10)
    #   end
    # end



    # def search_string
    #   search = ""
    #   @ingredients_search.each do |ingredient|
    #     search += "&allowedIngredient[]=" + ingredient.gsub(" ", "+")
    #   end
    #   search
    # end
  end
end
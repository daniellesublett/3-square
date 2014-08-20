module Yummly
  class Client
    include HTTParty
    base_uri "http://api.yummly.com/v1/"

    def initialize(params)
      @ingredients_search = params[:ingredients_search]
    end

#preps api query for recipe search
    def recipes
      api_uri = "/api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}&#{params[:ingredients_search]}" + search_string
      response = self.class.get(api_uri)

    end

#preps entered search for inclusion in the api call string
    def search_string
      search = ""
      @ingredients_search.each do |ingredient|
        search += "&allowedIngredient[]=" + ingredient.gsub(" ", "+")
      end
      search
    end
  end
end
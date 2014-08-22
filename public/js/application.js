
function bindEvents(){
  // submit ingretient from searchbar and display search results
  $("#search").on("submit", showRecipes);
  // $(".save_recipe_button").on("click", saveRecipe)

}

function showRecipes(event){
  event.preventDefault();
  var searchResults = $.ajax({
    url: '/search_recipe',
    type: "POST",
    data: $("#search").serialize()
  });
  searchResults.done(function(data){
    $("#recipe-search-results").append(data.results_html);
  });
}

function showShoppinglist(event){
  event.preventDefault();

}

  // add error handling


  bindEvents();

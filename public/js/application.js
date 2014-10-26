
function bindEvents(){
  // submit ingretient from searchbar and display search results
  $("#search").on("submit", handleSearch);
  $(".delete_recipe_button").on("click", deleteRecipe);

}

function handleSearch(event){
  if ($('#search').data('ajax-search')) {
    event.preventDefault();
    showRecipes();
  } else {
    return true;
  }
}

function showRecipes(){
  var searchResults = $.ajax({
    url: '/search_recipe',
    type: "POST",
    data: $("#search").serialize()
  });
  searchResults.done(function(data){
    $("#recipe-search-results").html(data.results_html);
  });
}

function deleteRecipe(event){
  event.preventDefault();
  var recipeToDelete = $(event.target).data('recipe-id');
  var ajaxDelete = $.ajax({
    url: '/delete_recipe',
    type: "POST",
    data: { recipe_id: recipeToDelete }
  });
  ajaxDelete.success(function(data){
    $('.saved_recipe[data-recipe-id=' + recipeToDelete + ']').remove();
  });
}

  // add error handling


  bindEvents();

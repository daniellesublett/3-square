
  function bindEvents(){
    // submit ingretient from searchbar and display search results
    $("#search").on("submit", add);
    // $(".navbar ")

  }

  function add(event){
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

  // add error handling


bindEvents();

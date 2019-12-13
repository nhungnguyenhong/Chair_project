$(function(){
  $("#show-limit").on("change", function(){
    $(this).closest("form").trigger("submit");
  });
  $("#search").on("click", function(){
    $(this).closest("form").trigger("submit");
  });
  $("#sort_by").on("change", function(){
    $(this).closest("form").trigger("submit");
  });
})
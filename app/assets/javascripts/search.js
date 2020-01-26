$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/notes/searches',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(notes) {
      console.log("ok");
    })
  });
});
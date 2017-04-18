$(document).ready(function(){
  var count = 0;
  $("#add-tag-button").click(function(){
    count +=1;
    $("#tag-box").append('<input id="tags_' + count + '" name="chronicle[tags][]' + '" type="text" />')
  })
});

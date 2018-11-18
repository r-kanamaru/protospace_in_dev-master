$(document).on('turbolinks:load', function(){

  function buildHTML(data){
    var html = `<div id = "dislike-button" data-button-id="${data.prototype_id}" data-likebutton-id="${data.id}">
                  <img src='/assets/icon_heart_red.svg'>
                </div>
                <div class= "like-count">${data.likes_count}</div>`
    return html;
  }

  function buildLikeHTML(data){
    var like_html = `<div id = "like-button" data-button-id="${data.prototype_id}">
                  <img src='/assets/icon_heart.svg'>
                  </div>
                  <div class= "like-count">${data.likes_count}</div>`
    return like_html;
  }

  $(".like-content").on("click", "#like-button", function(){
  console.log("hello");
  var id = 1;
  // var url = $(this).attr("action")
  var id1 = $(this).data('button-id')
  console.log(id1);
  $.ajax({
    url: '/prototypes/' + id1 + '/likes',
    type: 'POST',
    data: {'prototype_id': id1},
    dataType: 'json'
  })
  .done(function(data){
    console.log("hey");
    console.log(data);
    var html = buildHTML(data);
    $('[data-id = '+ id1 +']').html(html);
    // $('.like-content').html(html);
  })
  .fail(function(){
    console.log("データ通信に失敗しました");
  })

});

  $(".like-content").on("click", "#dislike-button", function(){
  console.log("dislike");
  var id = $(this).data('likebutton-id');
  // var url = $(this).attr("action")
  var id1 = $(this).data('button-id')
  console.log(id);
  console.log(id1);
  $.ajax({
    url: '/prototypes/' + id1 + '/likes/' + id,
    type: 'DELETE',
    data: {'prototype_id': id1},
    dataType: 'json'
  })
  .done(function(data){
    console.log(id1);
    console.log(data);
    var like_html = buildLikeHTML(data);
    $('[data-id = '+ id1 +']').html(like_html);
    // $('.like-content').html(like_html);
  })
  .fail(function(){
    console.log("データ通信に失敗しました");
  })

});

})


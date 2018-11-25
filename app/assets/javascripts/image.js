$(function(){

  //inputの値が変更になると処理を実行
  var input = $('input');
  input.change(function(){

    //fileが入っていない時は処理を終了
    if (!this.files.length) {
      return
    ;}

    //inputの兄弟要素imgを取得しておく
    //inputに設定された画像（配列）から[0]の取り出し
    //window_objectからfileReaderを生成
    //onloadによりfileReaderを読み込み後に処理が実行される
    var img = $(this).siblings('img');
    var file = this.files[0];
    var fileReader = new FileReader();
    fileReader.onload = function(event) {

    //imgにsrcを生成、event.targetはev発生源の要素値（画像）取得
    //imgにclassを生成
      img.attr('src', event.target.result);
      img.attr('class','set_img');

    //一旦、widthとheightの値を削除する
    //アスペクト比を保持したまま枠一杯に拡大させる処理
    //imgの縦横比率から広い方を100%にしアスペクト比率を保持
      img.removeAttr("width height");
      var imgWidth = img.width();
      var imgHeight = img.height();
      var asp = imgWidth / imgHeight;
      var asp_w_h = 100*asp;
        if(asp >= 1){
          img.attr('width','100%');
          img.attr('height','asp_w_h%');
        }else if(asp < 1){
          img.attr('width','asp_w_h%');
          img.attr('height','100%');
        }else{
          img.attr('width','100%');
          img.attr('height','100%');
        };

//画像の親要素にtext-align
//画像選択後に背景を消すためbackground:none
//Subの画像変更後も同様に背景を消す処理
      $('.set_img').parent().css('text-align','center');
      $('.set_img').parent().css('background','none');
      $('.set_img').parents('.list-group-item').css('background','none');
    };

  //fileReaderのfileデータ（画像）の読み込み
  fileReader.readAsDataURL(file);
  });
});


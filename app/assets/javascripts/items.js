$(function(){
  $('#notice-list').click(function(){
    if(!$(this).hasClass('activ-list')){
      $('#todo-list').removeClass('activ-list');
      $(this).addClass('activ-list');
    }
  });

  $('#todo-list').click(function(){
    if(!$(this).hasClass('activ-list')){
      $('#notice-list').removeClass('activ-list');
      $(this).addClass('activ-list');
    }
  });

  $('#trading').click(function(){
    if(!$(this).hasClass('activ-list')){
      $('#traded').removeClass('activ-list');
      $(this).addClass('activ-list');
      $('.trading').removeClass('hidden-list');
      $('.traded').addClass('hidden-list');
    }
  });

  $('#traded').click(function(){
    if(!$(this).hasClass('activ-list')){
      $('#trading').removeClass('activ-list');
      $(this).addClass('activ-list');
      $('.traded').removeClass('hidden-list');
      $('.trading').addClass('hidden-list');
    }
  });
});

// 新規投稿
$(function(){
  $('#price_calc').on('input', function(){   
    var data = $('#price_calc').val(); 
    var profit = Math.round(data * 0.9)  
    var fee = (data - profit) 
    $('.sell-form__price__right__text__r').html(fee) 
    $('.sell-form__price__right__text__r').prepend('¥') 
    $('.sell-form__price__right__rieki__r').html(profit)
    $('.sell-form__price__right__rieki__r').prepend('¥')
    $('#price').val(profit) 
    if(profit == '') {   
    $('.sell-form__price__right__rieki__r').html('');
    $('.sell-form__price__right__text__r').html('');
    }
  })
})
$(function(){
  
  const buildFileField = (num)=> {
  const html = `<div class="js-file_group=${num}" data-index=${num} data-swich="false">
                <input class="js-file" type="file"  name="[pictures][${num}][src]" id="_pictures_${num}_src">
                </div>`
  //               // `<div class="picture-box" data-index="${num}">
  //               // <input class="js-file" type="file" name="[pictures][${num}][src]" id="_pictures_${num}_src">
  //               // <br>
  //               // <span class="js-remove">削除</span>
  //               // <a href="/">編集</a>
  //               // </div>`
  
    return html; 
    
  }
    // プレビュー用のimgタグを生成する関数
    
    const buildImg = (index, url,)=> {
    const html = `<div class="box">
                  <img data-index="${index}" src="${url}" width="100px" height="100px"></img>
                  <div class="box-image__image-btn">
                  <button id=delete class="box-image__image-btn__update">削除</button>
                  <div id=delete class="box-image__image-btn__delete">削除</div>
                  </div>
                  `
                           
    return html;
    
    }

    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // 既に使われているindexを除外
    lastIndex = $('.js-file').data('index');
    fileIndex.splice(0, lastIndex);
   
    
    
    $('#picture-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');

      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      
      // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
        // fileIndexの先頭の数字を使ってinputを作る
        $('#previews').append(buildFileField(fileIndex[0]));
        
        fileIndex.shift();
        
        // 末尾の数に1足した数を追加する
        $('#previews').css("display","flex");
        $('#picture-box').css("flex-wrap","wrap");
        $('#_pictures_10_src.js-file').css("display","none");
        $(this).css("display","none");

    }
    
    $("#previews").on('click', '.box-image__image-btn__delete', function() {
    console.log("hellow")
    
    $(this).parent().parent(".box").remove();
    const targetFile =$(this).parent().parent().find("img").data("index");
    $(`div[data-index=${targetFile}]`).toggle();

    
    
    
    
    });


  });
});
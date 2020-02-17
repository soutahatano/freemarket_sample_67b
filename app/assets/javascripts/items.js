$(function(){
  function buildchildren(insertHTML){
    html = ` 
      <div class="sell-form__content__clearfix__form__group__field" id="children_category">
        <select name="parent_category_id" id="parent_category_id">
        <option value="">--</option>
        ${insertHTML}
        </select>
        </div>`
    $("#category_lists").append(html);
  };

  function buildgrandchildren(insertHTML){
    html = ` 
      <div class="sell-form__content__clearfix__form__group__field" id="grandchildren_category">
        <select name="category_id" id="category_id">
        <option value="">--</option>
        ${insertHTML}
        </select>
        </div>`
    $("#category_lists").append(html);
  };

  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  };

  function appendimg(img,id){
    var html =`
      <div class="sell-form__uploder__box__lists__list">
        <img type="file" src="${img}">
        <button class="box-image__image-btn__delete" data-picture-id = ${id}>削除</button>
      </div>`
      return html;
  };
  function appendfile(picture){
    var html =`<input class="sell-form__uploder__file" type="file" name="${picture}" id="${picture}">`
    $('.file_field_lists').append(html);
  };
  $(document).ready( function(){
      var img_count = $('.sell-form__uploder__box__lists__list').length;
      for( var i = 0; i < img_count; i ++){
        $(`#label-picture${i + 1}`).hide();
      };
  });
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
  });
  $('#price_calc').on('blur',function(){
    $('#error_price').empty();
    let value = $(this).val();
    if(value < 300 || value > 9999999){
      $('#error_price').append("<p class='error_count'>正しく入力してください</p>");
    }
  });
  $(document).on("change", "#grandparent_category_id", function(e) {
    e.preventDefault();
    $('#error_category').empty();
    let index = document.getElementById('grandparent_category_id').value;
    if(index != ""){
      $.ajax({
        type: "GET",
        url: "/items/get_category_children",
        data: {id: index},
        dataType: "json"
      })
      .done(function(categories){
        $("#children_category").remove();
        $("#grandchildren_category").remove();
        var insertHTML = '';
        categories.forEach(function(category){
          insertHTML += appendOption(category);
        });
        buildchildren(insertHTML);
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $("#children_category").remove();
      $("#grandchildren_category").remove();
      $('#error_category').append("<p class='error_count'>入力してください</p>");
    }
  });
  $(document).on("change", "#parent_category_id", function(e) {
    e.preventDefault();
    let index = document.getElementById('parent_category_id').value;
    $('#error_category').empty();
    if(index != ""){
      $.ajax({
        type: "GET",
        url: "/items/get_category_children",
        data: {id: index},
        dataType: "json"
      })
      .done(function(categories){
        $("#grandchildren_category").remove();
        var insertHTML = '';
        categories.forEach(function(category){
          insertHTML += appendOption(category);
        });
        buildgrandchildren(insertHTML);
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $("#grandchildren_category").remove();
      $('#error_category').append("<p class='error_count'>入力してください</p>");
    }
  });
  $(document).on('change', '.sell-form__uploder__file', function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    var id_label = `#label-${$(this).attr("id")}`;
    reader.onload = (function(file) {
      return function(e){
        var html = appendimg(e.target.result,id_label);
        $(".sell-form__uploder__box__lists").append(html);
      };
    })(file);
    reader.readAsDataURL(file);
    $(id_label).hide();
  });
  $(document).on("click", ".box-image__image-btn__delete", function(e){
    e.preventDefault();
    picture_id = $(this).data("picture-id");
    picture = picture_id.substr(-8, 8);
    $(this).parent().remove();
    $(picture_id).show();
    $(`#${picture}`).remove();
    appendfile(picture);
  });
  $('#name').on('blur',function(){
    $('#error_name').empty();
    let error;
    let value = $(this).val();
    if(value == ""){
      $('#error_name').append("<p class='error_count'>入力してください</p>");
    }else if(value.length > 40){
      $('#error_name').append("<p>40字以内で入力してください</p>");
    }
  });
  $('#text').on('blur',function(){
    $('#error_text').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_text').append("<p class='error_count'>入力してください</p>");
    }else if(value.length > 1000){
      $('#error_text').append("<p>1000字以内で入力してください</p>");
    }
  });
  $(document).on('blur','#category_id',function(){
    $('#error_category').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_category').append("<p class='error_count'>入力してください</p>");
    }
  });
  $('#status_id').on('blur',function(){
    $('#error_status').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_status').append("<p class='error_count'>入力してください</p>");
    }
  });
  $('#deliverycharge_id').on('blur',function(){
    $('#error_deliverycharge').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_deliverycharge').append("<p class='error_count'>入力してください</p>");
    }
  });
  $('#deliveryday_id').on('blur',function(){
    $('#error_deliveryday').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_deliveryday').append("<p class='error_count'>入力してください</p>");
    }
  });
  $('#prefecture_id').on('blur',function(){
    $('#error_prefecture').empty();
    let value = $(this).val();
    if(value == ""){
      $('#error_prefecture').append("<p class='error_count'>入力してください</p>");
    }
  });
  $(document).on('click',".sell-form__btn__box__exhibition",function(e){
  let error = $('.error_count').length;
  if(error > 0){
    alert("入力エラーがあります");
    e.preventDefault();
  }
});
  $('img').click(function(){
    $(this).attr('src');
    var a = $(this).attr('src');
    $('#picturepreview').children('img').attr('src',a);
    $("img").removeClass("active");
    $(".picture > img").addClass("hoge");
    $(this).removeClass("hoge");
    $(this).toggleClass("active");
  });
  $(document).ready( function(){
    $(".hoge").first().removeClass("hoge");
    });
});

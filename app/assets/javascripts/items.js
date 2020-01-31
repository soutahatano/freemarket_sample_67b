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
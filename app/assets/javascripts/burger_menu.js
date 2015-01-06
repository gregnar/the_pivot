$( document ).ready(function() {
  var $menuTrigger = $('.menu-trigger');
  var $body = $('body');

  $menuTrigger.unbind('click').click(function(){
    $body.toggleClass('menu-active');
  });

});

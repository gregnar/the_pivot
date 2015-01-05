/*
Slidemenu
*/
(function() {
  var $body = document.body
  , $menu_trigger = $body.getElementsByClassName('menu-trigger')[0];

  if ( typeof $menu_trigger !== 'undefined' ) {
    $menu_trigger.addEventListener('click', function() {
      $body.className = ( $body.className == 'menu-active' )? '' : 'menu-active';
    });
  }

}).call(this);

$( document ).ready(function() {
  var hamburger = $('#hamburger-icon');
  hamburger.click(function() {
    hamburger.toggleClass('active');
    return false;
  });
});

$(document).ready(function(){

  $("#address-form").hide();
  $("#delivery").click(function(){
    $("#address-form").slideToggle()
  });

  $(".enter-coordinates").click(function(){
    $(this).hide()
  });
  
});

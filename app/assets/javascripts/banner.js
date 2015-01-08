$( document ).ready(function() {
  if ($("#splash-login").css("margin-top") == "20px" ){
    setTimeout(function(){
        console.log("Darken the pic");
        $("#tint-me").addClass("tint");
      }, 1000);
	}
  setTimeout(function(){
    console.log("Hello, text.");
    $("#fade-me").removeClass("hidden")
    $("#fade-me").addClass("fade-in");
  }, 2000);
});

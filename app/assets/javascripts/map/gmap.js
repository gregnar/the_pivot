$(window).load(function() {
  loadScript();
});

var map;

function initialize() {

  var mapOptions = {
    center: new google.maps.LatLng(30.055487, 31.279766),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.NORMAL,
    panControl: true,
    scaleControl: false,
    streetViewControl: true,
    overviewMapControl: true
  };
  // initializing map
  map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

  // geocoding
  var geocoding  = new google.maps.Geocoder();
  $("#submit_button_geocoding").click(function(){
    codeAddress(geocoding);
  });
  $("#submit_button_reverse").click(function(){
    codeLatLng(geocoding);
  });


}

function initialize() {
  var mapOptions = {
    center: { lat: -34.397, lng: 150.644},
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
  mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);

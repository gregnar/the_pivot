$(window).load(function() {
  mapCurrentLocation();
});
//
// var map;

// function initialize() {
//   var myLatLng = new google.maps.LatLng(-25.363882,131.044922)
//   var mapOptions = {
//     center: myLatLng,
//     zoom: 8,
//     mapTypeId: google.maps.MapTypeId.NORMAL,
//     panControl: true,
//     scaleControl: false,
//     streetViewControl: true,
//     overviewMapControl: true
//   };
  // // initializing map
  // var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  // marker
  // var marker = new google.maps.Marker({
  //   position: myLatLng,
  //   map: map,
  //   title: 'Your position'
  // });

  // geocoding
  // var geocoding  = new google.maps.Geocoder();
  // $("#submit_button_geocoding").click(function(){
  //   codeAddress(geocoding);
  // });
  // $("#submit_button_reverse").click(function(){
  //   codeLatLng(geocoding);
  // });

// }

function mapCurrentLocation() {

  // var output = document.getElementById("map-canvas");
  // output.innerHTML = "<h5>Locating . . .</h5>";

  navigator.geolocation.getCurrentPosition(function(position) {
  //
    var initial_latitude = position.coords.latitude.toFixed(6);
    var initial_longitude = position.coords.longitude.toFixed(6);
    var userLatLng = new google.maps.LatLng(initial_latitude, initial_longitude);

    var mapOptions = {
      center: userLatLng,
      zoom: 10,
      scaleControl: false,
      streetViewControl: true,
      overviewMapControl: true
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var marker = new google.maps.Marker({
      position: userLatLng,
      map: map,
      draggable: true,
      title: "Drag this marker to your desired AirLift drop location.",
    });
    //
    // var infoContent = '<h2>Drop Location</h2>';
    //
    // var infoWindow = new google.maps.InfoWindow({
    //   content: infoContent
    // });
    //
    // google.maps.event.addListener(marker, 'click', function() {
    //   infoWindow.open(map,marker);
    // });
    //
    // output.innerHTML = '<h5>Latitude: ' + initial_latitude + '° <br>Longitude: ' + initial_longitude + '°</h5>';
    //
    // // eventually you need this function to send ajax request on button click w/o needing marker to move first
    // $('#confirm-delivery').click( function() {
    //   $('#order_latitude').attr('value', initial_latitude);
    //   $('#order_longitude').attr('value', initial_longitude);
    //   $("#delivery").hide("slow");
    //   $("#confirm").show("slow");
    //   $('#order-form').show(1200);
    // });
    //
    // google.maps.event.addListener(marker, 'dragend', function(evt){
    //   map.panTo(marker.getPosition());
    //
    //   document.getElementById('map-canvas').innerHTML = '<h5>Latitude: ' +
    //   evt.latLng.lat().toFixed(6) + '°<br>Longitude: ' + evt.latLng.lng().toFixed(6) + '°</h5>';
    //   var marker_lat = evt.latLng.lat();
    //   var marker_lng = evt.latLng.lng();
    //   $('#order_latitude').attr('value', marker_lat);
    //   $('#order_longitude').attr('value', marker_lng);
    //
    //
    //
    //   $('#confirm-delivery').click( function() {
    //     $("#delivery").hide("slow");
    //     $("#confirm").show("slow");
    //     $('#order-form').show(1200);
    //   });
    // });
  });
} // document.ready

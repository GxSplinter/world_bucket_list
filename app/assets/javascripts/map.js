var map;

$(document).ready(function() {
  showMap();
});

function showMap() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 1,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  loadMarkers();
}

function loadMarkers() {
  $.ajax({
    url: '/todos.json',
    dataType: 'json',
    success: function(json) {
      console.log(json);
      var bounds = new google.maps.LatLngBounds();

      _(json).each(function(todo) {
        binding.pry
        addMarker(todo.latitude, todo.longitude, todo.name);
        bounds.extend(new google.maps.LatLng(todo.latitude, todo.longitude));
      });

      map.fitBounds(bounds);
    }
  });
}

function addMarker(lat, lng, title) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map,
    title: title
  });
}

function zoomToMarker(lat, lng, title) {
  var bounds = new google.maps.LatLngBounds();
  addMarker(lat, lng, title);
  bounds.extend(new google.maps.LatLng(lat, lng));
  map.fitBounds(bounds);
}

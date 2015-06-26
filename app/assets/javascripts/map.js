var map;

$(document).ready(function() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showMap, loadMarkers, error);
  } else {
    alert('geolocation not supported');
  }
});

function error(msg) {
  alert('error: ' + msg);
}

function showMap(position) {
  var mapOptions = {
    center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
    zoom: 5,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
  mapOptions);

  loadMarkers(position);
}

function loadMarkers(position) {
  $.ajax({
    url: '/todos.json',
    dataType: 'json',
    success: function(json) {
      var bounds = new google.maps.LatLngBounds();

      _(json).each(function(todo) {
        if (typeof todo.latitude == 'number' && typeof todo.longitude == 'number') {
          addMarker(todo.latitude, todo.longitude, todo.name);
          bounds.extend(new google.maps.LatLng(todo.latitude, todo.longitude));
        }
      });

      addMarker(position.coords.latitude, position.coords.longitude, 'Me', 'http://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png');
      bounds.extend(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
      map.fitBounds(bounds);
    }
  });
}

function addMarker(lat, lng, title, icon) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map,
    icon: icon,
    title: title
  });
}

function zoomToMarker(lat, lng, title) {
  var bounds = new google.maps.LatLngBounds();
  addMarker(lat, lng, title);
  bounds.extend(new google.maps.LatLng(lat, lng));
  map.fitBounds(bounds);
}

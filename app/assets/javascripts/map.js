// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.onload = function() {
};

function add_document() {
  var address = document.getElementById("document_address").value;
  if (address != undefined && address != '') {
    get_lat_log(address);
  } else {
    document.getElementById("error").innerHTML = "NEED MORE SPECIFIC ADDRESS";
    return false;
  }
}

function get_lat_log(address) {
  address = address.split(' ').join('+');
  var jqxhr = $.ajax({
    url: "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApJ5eD8YdSK5SymAX8wp-_lx2luWItJQE&address=" + address,
    datatype: "jsonp",
  }).done(function() {
    console.log("AJAX SUCCESS");
  }).fail(function() {
    console.log("AJAX FAILURE");
  }).always(function(data) {
    data = data["results"];
    if (data.length > 1) {
      document.getElementById("error").innerHTML = "NEED MORE SPECIFIC ADDRESS";
      return false;
    } else {
      var lat = data[Object.keys(data)[0]]["geometry"]["location"]["lat"];
      var lng = data[Object.keys(data)[0]]["geometry"]["location"]["lng"];
      console.log([lat, lng]);
      document.getElementById("document_lat").value = lat;
      document.getElementById("document_lng").value = lng;
      document.forms[0].submit();
    }
  });
}

function initialize() {
  var mapOptions = {
    center: { lat: 38, lng: -90},
    zoom: 4,
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  var markers = [];
  for (var i = 0; i < json.length; i++) {
    var latLng = new google.maps.LatLng(json[i]["lat"], json[i]["lng"]);
    var marker = new google.maps.Marker({'position': latLng});
    marker.metadata = {id: json[i]["id"], name: json[i]["name"]};
    markers.push(marker);
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        $("#results").empty();
        $("#results").append("<li><a href='/view_document/" + json[i]["id"] + "'>" + json[i]["name"] + "</a></li>");
      }
    })(marker, i));
  }
  var clusterOptions = {averageCenter: true, zoomOnClick: false};
  var markerCluster = new MarkerClusterer(map, markers, clusterOptions);

  google.maps.event.addListener(markerCluster, 'clusterclick', function(cluster) {
    var markers = cluster.getMarkers();
    $("#results").empty();
    for (var i = 0; i < markers.length; i++) {
      $("#results").append("<li><a href='/view_document/" + markers[i].metadata.id + "'>" + markers[i].metadata.name + "</a></li>");
    }
  });
}

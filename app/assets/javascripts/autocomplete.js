function initializeAutocomplete(id) {
  var element = document.getElementById(id);

  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();
  $("#subscription_rdv_location").val(place.formatted_address)
}

$( document ).ready(function() {
  google.maps.event.addDomListener(window, 'load', function() {
    initializeAutocomplete('subscription_rdv_location');
  });
});

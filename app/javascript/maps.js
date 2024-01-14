let map;
let markers = [];

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerView } = await google.maps.importLibrary("marker");

  map = new Map(document.getElementById("map"), {
    center: { lat:  34.7024, lng: 135.4959 },
    zoom: 15,
  });
  
  const marker = new AdvancedMarkerView({
    position: location,
    map: map
  });
  markers.push(marker);
}

initMap();

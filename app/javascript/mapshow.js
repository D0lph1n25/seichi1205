let map;
let markers = [];

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerView } = await google.maps.importLibrary("marker");
  const latElement = document.getElementById("latitude-show");
  const lonElement = document.getElementById("longitude-show");
  const lat = parseFloat(latElement.textContent);
  const lon = parseFloat(lonElement.textContent);
  console.log(lat)
  map = new Map(document.getElementById("map-show"), {
    center: { lat: lat, lng: lon },
    zoom: 15,
  });
  
  const marker = new AdvancedMarkerView({
    position: { lat: lat, lng: lon},
    map: map
  });
  markers.push(marker);
}

window.addEventListener('turbo:load',initMap)


async function initMap() {
  const latElement = document.getElementById("latitude-show");
  const lonElement = document.getElementById("longitude-show");
  const lat = parseFloat(latElement.textContent);
  const lon = parseFloat(lonElement.textContent);
  const mySpot = { lat: lat, lng: lon };
  const { Map } = await google.maps.importLibrary("maps");

  
  map = new Map(document.getElementById("map-show"), {
    zoom: 15,
    center: mySpot,
  });
  
  const marker = new google.maps.Marker({
    map: map,
    position: mySpot,
  });
}

let map;
document.addEventListener('DOMContentLoaded', initMap);

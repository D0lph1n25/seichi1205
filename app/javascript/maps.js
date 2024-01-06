let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");

  map = new Map(document.getElementById("map"), {
    center: { lat:  34.7024, lng: 135.4959 },
    zoom: 15,
  });
}

initMap();
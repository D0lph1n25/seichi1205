let map;
let markers = [];

function initMap() {
    map = new google.maps.Map(document.getElementById("mapragistration-edit"), {
        center: { lat:  34.7024, lng: 135.4959 },
        zoom: 13,
    });

    // クリックしたときのイベントを追加
    map.addListener('click', function(event) {
        placeMarker(event.latLng);
    });
}


function placeMarker(location) {
    // 既存のマーカーを削除
    clearMarkers();

    // 新しいマーカーを作成
    const marker = new google.maps.Marker({
        position: location,
        map: map
    });

    // マーカーを配列に追加
    markers.push(marker);

    document.getElementById('latitude-edit').value = location.lat();
    document.getElementById('longitude-edit').value = location.lng();

    // ここで座標をサーバーに送信するなどの処理を実行できます
}

function clearMarkers() {
    // 既存のマーカーを地図から削除
    markers.forEach(marker => {
        marker.setMap(null);
    });

    // マーカー配列をクリア
    markers = [];
}

window.addEventListener('turbo:load',initMap)

import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');


if (mapElement) {

  mapboxgl.accessToken = "pk.eyJ1IjoibWFyY3VzbG9pc2VhdTEiLCJhIjoiY2pvaW5ybDRtMGIyeTNrbGN1ZThhMWY0NCJ9.f7J7urgu5cA5stJq5Ll_NA"; // API key from `.env`

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/marcusloiseau1/cjoiqc46y1hqf2smmjg3t0wev'
  });

  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  })

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }
   map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
  }));
}


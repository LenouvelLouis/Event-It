// Create a map in the "map" div, set the view to a given place and zoom
 map = L.map('map').setView([-34, -59], 13);

// add an OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
}).addTo(map);

// add the weather control
L.control.weather({
  apikey: {API_KEY}
  lang: "es",
  units: "metric"
}).addTo(map);
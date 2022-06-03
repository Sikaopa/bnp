import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
        .addTo(this.map)
    }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    console.log(this.markersValue.lng)
    bounds.extend([this.markersValue.lng, this.markersValue.lat])
    this.map.fitBounds(bounds, { padding: 80, maxZoom: 7, duration: 0 })
  }
}

import React from 'react'
import mapboxgl from 'mapbox-gl'
import { UberContext } from '../context/uberContext'


const style = {
    wrapper: `flex-1 h-full w-full`
}
export default function Map() {

// const access_token = 'pk.eyJ1IjoiZWxnZW5lc2lzYmxvY2siLCJhIjoiY2w1djVpOWxpMDJidTNscnQ0bHhxaDk2bCJ9.jsa850TKoWTXxuPKBxaF9A'

const access_token = process.env.NEXT_PUBLIC_MAPBOX_API_TOKEN
mapboxgl.accessToken = access_token


const {pickupCoordinates, dropoffCoordinates} = React.useContext(UberContext)


React.useEffect(() => {

    var map = new mapboxgl.Map(
        {

          container: 'map',
          style: "mapbox://styles/mapbox/dark-v10",
          
          center: [-99.29, 39],
          zoom: 3,

        }
    )


    
    if (pickupCoordinates) {
      console.log('we have pickup coordinates in Map.jsx', pickupCoordinates)
      // addToMap(map, [-74.0060152,40.7127281])
      addToMap(map, pickupCoordinates)
      

    }
    
    if (dropoffCoordinates) {
      console.log('we have dropoff coordinates in Map.jsx', dropoffCoordinates)
      // addToMap(map,[-96.7968559,32.7762719])
      addToMap(map, dropoffCoordinates)
    }
    
    if (pickupCoordinates && dropoffCoordinates) {
      console.log('we have both pickup and dropoff coordinates in Map.jsx')

    map.fitBounds([ pickupCoordinates, dropoffCoordinates], {
      padding: 400
    })

    }


}, [pickupCoordinates,dropoffCoordinates]

)


const addToMap = (map, coordinates) => {

  // const ll = new mapboxgl.LngLat(coordinates);

  new mapboxgl.Marker().setLngLat(coordinates).addTo(map)


  

}

  return (
    <div id="map" className={style.wrapper}>Map</div>
  )
}
 
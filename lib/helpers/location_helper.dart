const MAP_API_KEY =
    'pk.eyJ1Ijoicmprb2wiLCJhIjoiY2tmdG1lN3NlMHN5cTMycGQ5cGtjYWg2NCJ9.by4s4fSFm5mn0DeOQicJpw';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-s-a+f00(${longitude},${latitude})/${longitude},${latitude},16,0/600x300?access_token=${MAP_API_KEY}';
  }
}
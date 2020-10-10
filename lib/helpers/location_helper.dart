import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/dark-v10/static/pin-s-a+f00(${longitude},${latitude})/${longitude},${latitude},16,0/600x300?access_token=${MAP_API_KEY}';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${lng},${lat}.json?types=poi&access_token=${MAP_API_KEY}';
    final response = await http.get(url);
    return json.decode(response.body)['features'][0]['place_name'];
  }
}

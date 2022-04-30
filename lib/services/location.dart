import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/services/location.dart';

class Location {
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

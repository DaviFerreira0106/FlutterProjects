const String googleApiKey = 'AIzaSyCcPgCkRZUfwubBDSE5dDiX3VHWO3ti20U';

class LocationUtil {
  static String generateLocationPreviewImage(
      {required double longitude, required double latitude}) {
    return '''https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap
&markers=color:red%7Clabel:A%7C$latitude,$longitude
&key=$googleApiKey''';
  }
}

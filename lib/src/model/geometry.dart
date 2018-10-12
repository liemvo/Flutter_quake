class Geometry {
  final String type;
  final List<dynamic> coordinates;

  Geometry.fromJson(Map<String, dynamic> parsedJson)
    : type = parsedJson['type'],
    coordinates = parsedJson['coordinates'];
}
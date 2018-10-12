import 'geometry.dart';
import 'properties.dart';
class ItemModel {
  final String type;
  final Properties properties;
  final Geometry geometry;
  final String id;

  ItemModel.fromJson(Map<String,dynamic> parsedJson): 
    type = parsedJson['type'],
    geometry = Geometry.fromJson(parsedJson['geometry']),
    id = parsedJson['id'],
    properties = Properties.fromJson(parsedJson['properties']);
    
}
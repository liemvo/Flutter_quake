import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/item_model.dart';

final _root = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0';

class WakeProvider {
  Client client = Client();

  fetchFeatures() async {
    final response = await client.get('$_root/summary/all_day.geojson');
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      List _data = parsedJson['features'];
      
      List _result = List();
      for (int i = 0; i < _data.length; i++) {
        _result.add(ItemModel.fromJson(_data[i]));
      }
      return _result;
    } else {
      throw NullThrownError();
    }
  }
}


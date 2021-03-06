import 'package:quake_app/src/resources/wake_provider.dart';
import 'package:quake_app/src/model/item_model.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('Fetch features return list of features', () async {
    final wakeApi = WakeProvider();

    wakeApi.client = MockClient((request) async {
      final jsonMap = {'features' : [{'type' : 'Feature', 'properties' : {'mag': 1.2}, 'geometry' : {}, 'id' : ''}]};
      return Response(json.encode(jsonMap), 200);
    });

    final _data = await wakeApi.fetchFeatures();
    ItemModel itemModel = _data[0];
    expect(itemModel.type, 'Feature');
  });

  test('Fetch feature return null', () async {
    final wakeApi = WakeProvider();
    wakeApi.client = MockClient((request) async {
      return Response(json.encode(''), 404);
    });
    
    try {
     wakeApi.fetchFeatures();
    } on NullThrownError catch(e) {
      expect(e.toString(), 'Throw of null.');
    }
  });

}
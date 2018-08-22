import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

void main() async {

  List _data = await getJson();
  runApp(
      new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Wake app'),
            backgroundColor: Colors.deepOrange,
          ),
          body: new Center(
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    children: <Widget>[
                      new Divider(height: 5.0,),
                      new ListTile(
                        title: Text('${_formatDateFromMillisecond(_data[position]['properties']['time'])}',
                          style: new TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 17.9
                          ),
                        ),
                        subtitle: Text('${_data[position]['properties']['place']}',
                          style: new TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 13.9
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.greenAccent,
                          child: Text('${_data[position]['properties']['mag']}',
                              style: new TextStyle(
                                  fontSize: 16.4,
                                  color: Colors.white
                              )
                          ),
                        ),
                        onTap: () => _showOnTapMessage(context, _data[position]['properties']['title']),
                      )
                    ],
                  );
                }
            )
          )
        )
      )
  );
}

String _formatDateFromMillisecond(int timeMillisecond){
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeMillisecond);
  return '${(new DateFormat('yMMMMd')).format(dateTime)} ${(new DateFormat.jm()).format(dateTime)}';
}
void _showOnTapMessage(BuildContext context, String message)
{
  var alert = new AlertDialog(
    title: Text('Quake'),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}
Future<List> getJson() async {
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body)['features'];
}
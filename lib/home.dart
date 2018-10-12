import 'package:flutter/material.dart';
import 'src/resources/wake_provider.dart';
import 'src/util/utility.dart';
import 'src/model/item_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _data = List();
  @override
  void initState(){
    super.initState();
    _loadData();
  }

  _loadData() async {
    List _newData  = await WakeProvider().fetchFeatures();
    setState(() {
      _data = _newData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Wake app'),
              backgroundColor: Colors.deepOrange,
            ),
            body: Center(
                child: ListView.builder(
                    itemCount: _data!= null? _data.length : 0,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (BuildContext context, int position) {
                      ItemModel itemModel = _data[position];
                      return Column(
                        children: <Widget>[
                          Divider(height: 5.0,),
                          ListTile(
                            title: Text('${formatDateFromMillisecond(itemModel.properties.time)}',
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 17.9
                              ),
                            ),
                            subtitle: Text('${itemModel.properties.title}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13.9
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              child: Text('${itemModel.properties.mag}',
                                  style: TextStyle(
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
    );
  }
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

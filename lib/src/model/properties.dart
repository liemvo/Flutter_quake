class Properties {
  final double mag;
  final String place;
  final int time;
  final int updated;
  final int tz;
  final String url;
  final String detail;
  final String status;
  final int tsunami;
  final int sig;
  final String net;
  final String code;
  final String ids;
  final String sources;
  final String types;
  final int nst;
  final String mapType;
  final String type;
  final String title;

  Properties.fromJson(Map<String,dynamic> parsedJson)
   :  mag = double.parse(parsedJson['mag'].toString()),
    place = parsedJson['place'],
    time = parsedJson['time'],
    updated = parsedJson["updated"],
    tz = parsedJson['tz'],
    url = parsedJson['url'],
    detail = parsedJson['detail'],
    status = parsedJson['status'],
    tsunami = parsedJson['tsunami'],
    sig = parsedJson['sig'],
    net = parsedJson['net'],
    code = parsedJson['code'],
    ids = parsedJson['ids'],
    sources = parsedJson['sources'],
    types = parsedJson['types'],
    nst = parsedJson['nst'],
    mapType = parsedJson['mapType'],
    type = parsedJson['type'],
    title = parsedJson['title'];
}
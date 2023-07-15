import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  var location;
  var time;
  var url;
  var flag;
  var isDayTime; // true or false if it's daytime

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {

    var get = Uri.https(
      'worldtimeapi.org',
      '$url'
    );
    var response = await http.get(get);
    Map <String, dynamic> data = json.decode(response.body);
    print (data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(datetime); 
    // ignore: avoid_print
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);

  }

}



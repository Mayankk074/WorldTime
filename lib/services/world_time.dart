import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String? location; //location name for the UI
  String? time; //time in that location
  String? flag; //url to an asset flag icon
  String? url; //location url for api endpoint
  bool? isDaytime;

  WorldTime({this.url, this.flag, this.location});
  //Telling the caller to wait till this function completes
  Future<void> getTime() async{

    try{
      Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data= jsonDecode(response.body);

      String dateTime= data['utc_datetime'];
      String offset1= data['utc_offset'].substring(1,3);
      String offset2= data['utc_offset'].substring(4);

      DateTime now= DateTime.parse(dateTime);
      now=now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      isDaytime= now.hour > 6 && now.hour <19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error : $e');
      time='could not get time';
    }

  }


}
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url: 'Asia/Kolkata', flag: 'India.jpg', location: 'India'),
    WorldTime(url: 'America/Chicago', flag: 'USA.png', location: 'USA'),
    WorldTime(url: 'Australia/Melbourne', flag: 'Australia.png', location: 'Australia'),
    WorldTime(url: 'Africa/Cairo', flag: 'Egypt.png', location: 'Egypt'),
    WorldTime(url: 'Asia/Bangkok', flag: 'Thailand.png', location: 'Thailand'),
    WorldTime(url: 'Asia/Dubai', flag: 'UAE.png', location: 'UAE'),
    WorldTime(url: 'Asia/Kabul', flag: 'Afghanistan.png', location: 'Afghanistan'),
    WorldTime(url: 'Asia/Karachi', flag: 'Pakistan.png', location: 'Pakistan'),
    WorldTime(url: 'Asia/Tokyo', flag: 'Japan.png', location: 'Japan'),
  ];

  void updateTime(index) async {
    WorldTime instance= locations[index];
    await instance.getTime();
    //Navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
      'time': instance.time,
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text('${locations[index].location}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )

    );
  }
}

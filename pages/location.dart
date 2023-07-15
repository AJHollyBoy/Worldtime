import 'package:flutter/material.dart';
import 'package:webtime/services/time.dart';

 class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> location = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpg',),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'Germany.jpg',),
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.png',),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png',),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'chicago.png',),
    WorldTime(url: 'America/New_York', location: 'USA', flag: 'usa.png',),
    WorldTime(url: 'Asia/Seoul', location: 'Korea', flag: 'Korea.jpg',),
    WorldTime(url: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.png',),
  ];

  void updateTime(index) async {
    WorldTime instance = location[index];
    instance.getTime();
    // navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, {
           'location': instance.location,       
           'flag': instance.flag,
           'time': instance.time,
           'isDayTime': instance.isDayTime,      
    } as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar (
        backgroundColor: Colors.green[800],
        title: const Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Card(
              child: ListTile (
                onTap: () {
                  updateTime(index);
                  // print(location[index].location);
                },
                title: Text (location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),
            ),
          );
  }),
        ),
    );
  }
}
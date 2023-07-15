import 'package:flutter/material.dart';
import '../services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Lagos', flag: 'joseph.png', url:'api/timezone/Africa/Lagos',);
    await instance.getTime();
    Future.delayed(const Duration(seconds: 3), () {
                      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: {
            'location': instance.location,       
            'flag': instance.flag,
            'time': instance.time,
            'isDayTime': instance.isDayTime,
              });
              },);
  }

  @override 
  initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: const Center(
        child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
),
        ),
    );
  }
}
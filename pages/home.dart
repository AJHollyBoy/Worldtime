import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // ignore: avoid_print
    print(data);

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    // set background

    final dynamic bgImage = (data['isDayTime'] ?? true )? 'day.jpg' : 'night.png';
    final Color bgColor = (data['isDayTime'] ?? true)? const Color.fromARGB(255, 5, 55, 95) : const Color.fromARGB(255, 61, 13, 13);

    return Scaffold(
      backgroundColor: bgColor,
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/$bgImage'
            )
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget> [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data['location']}',
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 2.0,
                        color: Color.fromARGB(255, 208, 16, 16),
                      ),
                    )
                  ],
                ),
              const SizedBox(height: 20),
              SizedBox(
                child: Text(
                    '${data['time']}',
                    style:const TextStyle( 
                      fontSize: 70,
                      letterSpacing: 0.01,
                      color: Color.fromARGB(255, 208, 16, 16),
                    ),
                  ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: TextButton.icon (
                  style: const ButtonStyle(
                    // backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 22, 110, 38)),
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 208, 16, 16),
                    ),
                  label: const Text(
                    'Edit Location',
                    style: TextStyle(
                      color:  Color.fromARGB(255, 208, 16, 16),
                    ),),
                  ),
              ),
            ]
        ),
            ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:webtime/pages/home.dart';
import 'package:webtime/pages/loading.dart';
import 'package:webtime/pages/location.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const Location(),
  },
));
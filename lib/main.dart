import 'package:clock_app/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/home.dart';
import 'package:clock_app/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/Location': (context) => ChooseLocation()
  },
));

import 'package:flutter/material.dart';
import 'package:newm2/pages/home.dart';
import 'package:newm2/pages/loading.dart';
import 'package:newm2/pages/location.dart';


void main() {
  runApp(MaterialApp(
   initialRoute: '/',
    routes: {
      '/':(context)=> Loading(),
      '/home':(context)=> Home(),
      '/location':(context)=> Location(),
    },
  ));
}

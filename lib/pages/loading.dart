import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



import '../services/world_time.dart';class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';


void setWorldTIme() async{
  WorldTime worldTime=WorldTime(location: 'Nigeria',  flag: 'map.jpg', url: 'Africa/Lagos');
await worldTime.getTime();
Navigator.pushReplacementNamed(context,'/home',arguments: {
  'location':worldTime.location,
  'flag':worldTime.flag,
  'time':worldTime.time,
  'isDaytime':worldTime.isDaytime,
} );

}
  @override
  void initState() {
    super.initState();
    setWorldTIme();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    body: Center(
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    ),
    );


  }
}

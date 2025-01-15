import 'package:flutter/material.dart';
import 'package:newm2/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // int counter = 0;
List<WorldTime> locations=[
  WorldTime( location: 'Lagos', flag: 'flag.jpeg', url:'Africa/Lagos' ),
  WorldTime( location: 'Germany', flag: 'germany.png', url:'Africa/Nairobi' ),
  WorldTime( location: 'Cairo', flag: 'egypt.png', url:'Africa/Cairo' ),
  WorldTime( location: 'Indonesia', flag: 'indonesia.png', url:'Asia/Jakarta'),
  WorldTime( location: 'Kenya', flag: 'kenya.png', url:'Africa/Nairobi'),
  WorldTime( location: 'Seoul', flag: 'south_korea.png', url:'Asia/Seoul' ),
  WorldTime( location: 'Athens', flag: 'greece.png', url:'`Europe/Berlin' ),
  WorldTime( location: 'Abuja', flag: 'flag.jpeg', url:'Africa/Abuja' ),
];


void UpdateTime(index) async{
WorldTime worldTime=locations[index];
await worldTime.getTime();
//navigate to homescreen
Navigator.pop(context,{
  'location':worldTime.location,
  'flag':worldTime.flag,
  'time':worldTime.time,
  'isDaytime':worldTime.isDaytime,
});
}



  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
    body: ListView.builder(itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: Card(
          child: ListTile(
            onTap: (){
              UpdateTime(index);
              //print(locations[index].location);
            },
            title: Text(locations[index].location),
            leading:CircleAvatar(
              backgroundImage: AssetImage('asset/${locations[index].flag}'),
            ),
          ),
        ),
      );
    },
      itemCount: locations.length),

      );

  }
}

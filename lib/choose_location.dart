import 'package:clock_app/Services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<world_time> locations = [
    world_time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    world_time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    world_time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    world_time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    world_time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    world_time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    world_time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    world_time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg'),
    world_time(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.jpg'),
    world_time(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    world_time(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
  ];

  void updateTime(index) async {
    world_time obj = locations[index];

    //Await for the data
    await obj.getData();
    //Send the data to the Home screen
    // Navigator.pushReplacementNamed(context,'/home', arguments: {
    //   'location' : obj.location,
    //   'flag' : obj.flag,
    //   'time' : obj.time,
    //   'isDayTime': obj.isDayTime,
    // });
    // We don't do this because we need to pop the screen rather than creating a
    // new  screen at top of that as this will increase the burden.
    Navigator.pop(context, {
      'location' : obj.location,
      'flag' : obj.flag,
      'time' : obj.time,
      'isDayTime': obj.isDayTime,
    });

  }

  Widget build(BuildContext context) {
    //Runs every time we change the state of counter using setState() method.
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('Assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

import'package:clock_app/Services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Spinkit is used for the cool spinner.

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setWorldTime() async {
    world_time obj = world_time(location: 'Berlin', flag: 'germany.jpg', url: "Europe/Berlin");
    await obj.getData();
    //This await is used so that the print statement does not return data before
    // we even get the data in the time class.
    //The future lets the await know that the function is complete and then it will
    // return the data that can be used here.
    // print(obj.time);
    // This is to fetch and use the data here
    // setState(() {
    //   time = obj.time;
    // });

    //But we need to return the data to the home screen widget.
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location' : obj.location,
      'flag' : obj.flag,
      'time' : obj.time,
      'isDayTime': obj.isDayTime,
    });
    //This is same as in java, we send a key value pair(Map in this case) to
    // the activity and retrieve it there.

  }

  void initState(){
    super.initState();
    //Runs once when we first start the activity.
    setWorldTime();
    //This produces the async feature where while waiting for data retrieval,
    //Our app still runs while waiting for the  data and avoids any bottlenecks.
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitHourGlass(
                      color: Colors.white,
                      size: 100.0,
                     ),
              Text(
                  'Loading',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
              )
            ],
          ),
        )
    );
  }
}

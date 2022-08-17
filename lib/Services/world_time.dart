import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

// dart:convert is for using the jsonDecider method.
// http.dart package is used to get the http request for our app.
// intl.dart is used for formatting the date/time that we get from the function

// ignore: camel_case_types
class world_time{
  String location; //Location name for UI
  String time; // the Time in location
  String flag; // url to an flag
  String url; // location url for API endpoint
  bool isDayTime; // To see if its day/night

  world_time({this.location,this.flag,this.url});

  Future<void> getData() async {
    //Future is like a wrapper void but only when this async function gets complete.
    //This is like a promise to dart that we it will return something.

    // //Simulate a network request for username
    // String username = await Future.delayed(Duration(seconds: 2),() {
    //   //Call Back function i.e. called after the delay
    //   return 'Ainz';
    // } );
    //
    // //Now if we need to make another request to a server based on username,
    // //This code wont work as it will request server without username.
    // //So we need to synchronize the code.
    // //We will declare the function async overall but put await so that we can send
    // //Requests to server before fetching data
    // //the async helps the the other tasks to perform smoothly but wait for
    // //Server to give username and bio.
    //
    // String bio = await Future.delayed(Duration(seconds: 1),() {
    //   //Call Back function i.e. called after the delay
    //   return 'The ruler of the Sorcerous Kingdom of Ainz Ooal Gown';
    // } );
    //
    // //print that data that was fetched.
    // print('$username - $bio');

    // Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    // print(response.body);
    // //The response body is a string not a map or object of any kind.
    // // We need to convert it to use the different fields.
    // Map data = jsonDecode(response.body);
    // //Just like python dictionaries/hashMaps JS has Map but it is used like python.
    // print(data);
    // print(data['title']);
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from Data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // We only need the data part not the + sign and the : sign.
      // So we take the substring from the part we require.

      // print(datetime);
      // print(offset);

      //Create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // Set the time property
      time = DateFormat.jm().format(now);
      //This turns our time into a good format.

      // Set the isDayTime
      isDayTime = (now.hour>6 && now.hour<20) ? true:false ;

    }
    catch(e) {
      print('Caught error while loading URL : $e');
      time = 'Could not LOAD the DATA!!!';
    }

  }

}


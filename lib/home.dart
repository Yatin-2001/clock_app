import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //setState function is used only when we need to update the data inside the
    // return part of build because it is gonna change very time and rebuild the
    // the widget tree.

    // Now since we are only popping(pressing the back button) the screen and not
    // rebuilding it again, this will not work. Solution is given below.
    // data =  ModalRoute.of(context).settings.arguments;
    //Now if we leave it like this, every time we call the build, it will load
    // with the Default Data and not load the object.

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color txtcolor = data['isDayTime'] ? Colors.black : Colors.white ;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/$bgImage'),
            fit: BoxFit.cover,
            //This will make it cover the entire screen
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/Location');
                    //This task is just like opening a screen and then removing
                    // it from the stack which is a single time just taking some
                    // time. Thus it can be viewed as a async task.
                    //Since we  don't know the return type, we use dynamic keyword.

                    //Now to set the Map to the returned data we use set dtate.
                    setState((){
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDayTime': result['isDayTime'],
                      };
                    });

                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 20,
                    color: Colors.redAccent,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 15.0,

                    )
                  ),
                ),

                SizedBox(height: 20.0,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 2.0,
                            color: txtcolor,
                          ),
                        )
                    ],
                ),

                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 50.0,
                        letterSpacing: 2.0,
                        color: txtcolor,
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}

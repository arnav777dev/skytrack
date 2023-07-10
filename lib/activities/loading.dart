import 'package:flutter/material.dart';
import 'package:skytrack/backend/api_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();

}

bool first = true;
class _loadingState extends State<loading> {
  bool _isLoading = true;

  String? location = "";
  String temp = "";
  String temp_min = "";
  String temp_max = "";
  String feel_like = "";
  String desc = "";
  String humidity = "";
  String air_speed = "";
  String name = "";
  String sunrise = "";
  String sunset = "";
  String id = "";

  void startApp(String? city) async {
    apidata curr = new apidata(city);
    await curr.getdata();
    setState(() {
      temp = curr.temp;
      location = curr.location;
      temp_max = curr.temp_max;
      temp_min = curr.temp_min;
      feel_like = curr.feel_like;
      desc = curr.desc;
      humidity = curr.humidity;
      air_speed = curr.air_speed;
      sunset = curr.sunset;
      sunrise = curr.sunrise;
      id = curr.id;
      name = curr.name;
    });
    _isLoading = false;
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp": temp,
      "location": location,
      "temp_max": temp_max,
      "temp_min": temp_min,
      "feel_like": feel_like,
      "desc": desc,
      "humidity": humidity,
      "air_speed": air_speed,
      "sunset": name,
      "sunrise": sunrise,
      "sunset": sunset,
      "id" : id,
      "name" : name,
    });
  }

  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   List<String?> arguments ;
  //   if (first) {
  //     startApp("Delhi");
  //     first = false;
  //   } else {
  //     final dynamic receivedArguments =
  //         ModalRoute.of(context)?.settings.arguments;
  //     if (receivedArguments != null && receivedArguments is List<String?>) {
  //       arguments = receivedArguments;
  //       startApp(arguments[0]);
  //     } else {
  //       startApp("Delhi");
  //     }
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    // List<String?> arguments ;
    // if (first) {
    //   startApp("Delhi");
    //   first = false;
    // } else {
    //   final dynamic receivedArguments =
    //       ModalRoute.of(context)?.settings.arguments;
    //   if (receivedArguments != null && receivedArguments is List<String?>) {
    //     arguments = receivedArguments;
    //     startApp(arguments[0]);
    //   } else {
    //     startApp("Delhi");
    //   }
    // }
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  bool built = true;
  void bapp(){
    List<String?> arguments ;
    if (first) {
      startApp("Delhi");
      first = false;
    } else {
      final dynamic receivedArguments =
          ModalRoute.of(context)?.settings.arguments;
      if (receivedArguments != null && receivedArguments is List<String?>) {
        arguments = receivedArguments;
        startApp(arguments[0]);
      } else {
        startApp("Delhi");
      }
    }
    built = false;
  }
  @override
  Widget build(BuildContext context) {
    if(built) bapp();

    // print(searchdata["city"]);
    return Scaffold(
      body: SafeArea(
        child: Center(child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Image.asset("assets/images/logo1.png"),
              Text("SkyTrack",style: TextStyle(fontSize: 50,fontFamily: 'caveat'),),
              SizedBox(height: 200,),
              SpinKitWave(
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(height: 120,),
              Text("Created By: Arnav Dev",style: TextStyle(fontFamily: 'caveat',fontSize: 20),)
            ],
          ),
        )),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}

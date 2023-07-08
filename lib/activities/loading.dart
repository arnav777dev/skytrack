import 'package:flutter/material.dart';
import 'package:skytrack/backend/api_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String location = "";
  String temp = "";
  String temp_min = "";
  String temp_max = "";
  String feel_like = "";
  String desc = "";
  String humidity = "";
  String air_speed = "";
  String name = "";
  void startApp() async {
    apidata curr = new apidata("Delhi");
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
      name = curr.name;
    });
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp": temp,
      "location": location,
      "temp_max": temp_max,
      "temp_min": temp_min,
      "feel_like": feel_like,
      "desc": desc,
      "humidity": humidity,
      "air_speed": air_speed,
      "name": name
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Column(
          children: [
            Image.asset("assets/images/logo1.png"),
            Text("SkyCast"),
            Text(" Arnav Dev")
          ],
        )),
      ),
    );
  }
}

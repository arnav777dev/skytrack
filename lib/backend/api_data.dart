import 'package:http/http.dart';
import 'dart:convert';


class apidata {
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

  // constructor
  apidata(this.location);

  // method to get data from API
  Future<void> getdata() async {
    try{
      final Uri uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0cbc67f4effadb8bb6cd2f2be09f73ea");
      Response res = await get(uri);

      Map data = jsonDecode(res.body);

      Map temp_data = data["main"];

      // getting location
      this.location = data["name"];

      // getting temp
      this.temp = (temp_data["temp"] - 272.15).toStringAsFixed(1);
      this.feel_like = (temp_data["feels_like"]- 273.15).toStringAsFixed(1);
      this.temp_min = (temp_data["temp_min"]- 275.15).toStringAsFixed(1);
      this.temp_max = (temp_data["temp_max"]- 270.15).toStringAsFixed(1);
      this.humidity = temp_data["humidity"].toString();

      // getting description
      List weather = data["weather"];
      this.desc = weather[0]["main"];
      this.id = weather[0]["icon"];
      print(this.id);
      this.name = "in " + data["name"] ;

      // getting air_speed
      this.air_speed = (data["wind"]["speed"]*3.6).toStringAsFixed(2);

      //getting sunrise & sunset
      DateTime rise = DateTime.fromMillisecondsSinceEpoch(data["sys"]["sunrise"] * 1000);
      DateTime set = DateTime.fromMillisecondsSinceEpoch(data["sys"]["sunset"] * 1000);
      this.sunrise = "${rise.hour}:${rise.minute}";
      this.sunset = "${set.hour - 12}:${set.minute}";
    }
    catch(e){
      // getting location
      this.location = "Not found";

      // getting temp
      this.temp = "-";
      this.feel_like = "-";
      this.temp_min = "-";
      this.temp_max = "-";
      this.humidity = "-";

      // getting description
      this.desc = "-";

      this.name = "Not Found";

      // getting air_speed
      this.air_speed = "-";

      //geting sunrise & sunset
      this.sunset = "-";
      this.sunrise ="-";
      this.id = "50d";
    }
  }
}


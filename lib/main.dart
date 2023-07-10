import 'package:flutter/material.dart';
import 'package:skytrack/activities/loading.dart';
import 'package:skytrack/activities/location.dart';
import 'package:skytrack/activities/home.dart';

bool first = true;
String rout = "";
void main() {
  if(first){
    rout = "/";
    first = false;
  }
  else{
    rout = "/home";
  };
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    routes: {
      rout: (context) => loading(),
      "/loading": (context) => loading(),
      "/locations": (context) => location(),
      "/home": (context) => home(),
    },
  ));
}

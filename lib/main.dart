import 'package:flutter/material.dart';
import 'package:skytrack/activities/loading.dart';
import 'package:skytrack/activities/location.dart';
import 'package:skytrack/activities/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => loading(),
      "/loading": (context) => loading(),
      "/locations": (context) => location(),
      "/home": (context) => home(),
    },
  ));
}

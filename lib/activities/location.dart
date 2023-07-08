import 'package:flutter/material.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text("Locations More", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/home");
            }, child: Text("Back to Home"))
          ],
        )
    );
  }
}

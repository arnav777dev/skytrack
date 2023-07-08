import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Map<String, dynamic> currData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MAUSAM"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(currData["temp"].toString()),
      ),
    );
  }
}

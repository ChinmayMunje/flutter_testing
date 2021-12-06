import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBarDemo extends StatefulWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  _AppBarDemoState createState() => _AppBarDemoState();
}

class _AppBarDemoState extends State<AppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to GFG"),
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Notification Clicked..",
                    toastLength: Toast.LENGTH_SHORT);
              },
              icon: const Icon(Icons.doorbell_rounded)),
        ],
      ),
      body: const Center(
        child: Text(
          "Welcome to Geeks for Geeks",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

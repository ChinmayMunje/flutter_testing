import 'package:flutter/material.dart';

class InformationDisplayPage extends StatefulWidget {
  const InformationDisplayPage({Key? key}) : super(key: key);

  @override
  _InformationDisplayPageState createState() => _InformationDisplayPageState();
}

class _InformationDisplayPageState extends State<InformationDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information and Displays"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 30.0,
            ),
            SizedBox(
              height: 30,
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: const Text('S'),
              ),
              label: const Text('Sample Chip'),
            )
          ],
        ),
      ),
    );
  }
}

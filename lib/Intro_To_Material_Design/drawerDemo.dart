import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key? key}) : super(key: key);

  displayMessage(message) {
    Fluttertoast.showToast(
        msg: message + " Clicked..", toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                displayMessage("Messages");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                displayMessage("Profile");
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  displayMessage("Settings");
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: const Center(
        child: Text("Welcome to Geeks for Geeks"),
      ),
    );
  }
}

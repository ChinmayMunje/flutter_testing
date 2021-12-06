import 'package:flutter/material.dart';

class DialogAlertPage extends StatefulWidget {
  const DialogAlertPage({Key? key}) : super(key: key);

  @override
  _DialogAlertPageState createState() => _DialogAlertPageState();
}

class _DialogAlertPageState extends State<DialogAlertPage> {
  Future<void> showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              width: 300,
              height: 250,
              color: Colors.white54,
              alignment: Alignment.center,
              child: Text('Breathe in... Breathe out...'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog and Alerts"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  showAlertDialog();
                },
                child: Text("Display Alert Dialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet(context);
                },
                child: Text("Display Bottom Sheet Dialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Awesome Snackbar!'),
                      action: SnackBarAction(
                        label: 'Action',
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
                },
                child: Text("Display SnackBar")),
          ],
        ),
      ),
    );
  }
}

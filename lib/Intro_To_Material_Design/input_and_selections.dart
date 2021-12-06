import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputAndSelectionDemo extends StatefulWidget {
  const InputAndSelectionDemo({Key? key}) : super(key: key);

  @override
  _InputAndSelectionDemoState createState() => _InputAndSelectionDemoState();
}

enum SingingCharacter { Radio1 }

class _InputAndSelectionDemoState extends State<InputAndSelectionDemo> {
  bool checkValue = false;
  SingingCharacter? _character = SingingCharacter.Radio1;

  displayCHeckMessage(message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Checkbox(
                value: checkValue,
                onChanged: (bool? value) {
                  checkValue = value!;
                  setState(() {
                    if (checkValue) {
                      displayCHeckMessage("Checkbox Checked..");
                    } else {
                      displayCHeckMessage("Checkbox UnChecked..");
                    }
                  });
                }),
            const SizedBox(
              height: 20,
            ),

            ListTile(
              title: const Text('Radio 1'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Radio1,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homebrew_sum2/screens/how_many_cups.dart';

import 'package:homebrew_sum2/models/homebrew.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  List<String> devices = ['French Press', 'Drip Machine'];
  bool frenchSel = false;
  bool dripSel = false;
  bool btnEnable = false;

  _onPressed() {
    if (frenchSel) {
      Homebrew homebrew = Homebrew(0, "French Press");
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InputNumber(homebrew)));
      });
    } else {
      Homebrew homebrew = Homebrew(0, "Drip Machine");
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InputNumber(homebrew)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "What coffee maker are you using?",
            key: Key('device-choose'),
            style: TextStyle(
                fontFamily: "Montserrat", color: Colors.blueGrey, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CheckboxListTile(
                    key: Key("French-press"),
                    activeColor: Colors.white,
                    checkColor: Colors.blueGrey,
                    value: frenchSel,
                    title: Text(
                      devices[0],
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey,
                          fontSize: 20),
                      key: Key("French-press-text"),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        frenchSel = newValue;
                        dripSel = false;
                        btnEnable = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  Divider(
                    color: Colors.blueGrey[100],
                    thickness: 1.5,
                  ),
                  CheckboxListTile(
                    key: Key("Drip-machine"),
                    activeColor: Colors.white,
                    checkColor: Colors.blueGrey,
                    value: dripSel,
                    title: Text(
                      devices[1],
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey,
                          fontSize: 20),
                      key: Key("Drip-machine-text"),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dripSel = newValue;
                        frenchSel = false;
                        btnEnable = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            height: 55,
            child: RaisedButton(
                key: Key("continue-btn"),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontSize: 15),
                ),
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                onPressed: btnEnable ? () => _onPressed() : null),
          ),
        ],
      ),
    ));
  }
}

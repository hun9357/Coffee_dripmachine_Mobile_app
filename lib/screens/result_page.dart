import 'package:flutter/material.dart';
import 'package:homebrew_sum2/screens/choose_device_screen.dart';

import 'package:homebrew_sum2/models/homebrew.dart';

class ResultPage extends StatefulWidget {
  Homebrew homebrew;

  ResultPage(this.homebrew);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.blueGrey,
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 180,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                          fontFamily: "Kollektif",
                          color: Colors.blueGrey,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 2.5, bottom: 20),
                      child: Divider(
                        color: Colors.blueGrey,
                        thickness: 1.5,
                      ),
                    ),
                    Text(
                      widget.homebrew.coffeeGrams.toString() +
                          "g - " +
                          widget.homebrew.coffeeType +
                          " coffee",
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          color: Colors.blueGrey,
                          fontSize: 15),
                      key: Key('coffee-text'),
                    ),
                    Text(
                      widget.homebrew.waterGram.toString() + "g - water",
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          color: Colors.blueGrey,
                          fontSize: 15),
                      key: Key('water-text'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text(
                        "Enjoy your delicious coffee",
                        style: TextStyle(
                            fontFamily: "Montserrat-italic",
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                width: 300,
                height: 55,
                child: RaisedButton(
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: 15),
                      key: Key('done-btn'),
                    ),
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    onPressed: isEnable
                        ? () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChooseDeviceScreen()));
                            });
                          }
                        : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

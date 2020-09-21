import 'package:flutter/material.dart';

import 'package:homebrew_sum2/models/homebrew.dart';
import 'package:homebrew_sum2/screens/result_page.dart';

class InputNumber extends StatefulWidget {
  Homebrew homebrew;

  InputNumber(this.homebrew);

  @override
  _InputNumberState createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              })),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "How many cups would you like?",
                key: Key('how-many-cups'),
                style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50,
                    child: TextFormField(
                      key: Key('input-textfield'),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          if (text.length > 0 && int.parse(text) > 0) {
                            isEnable = true;
                            widget.homebrew.cups = int.parse(text);
                          } else {
                            isEnable = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                          errorText:
                              !isEnable ? 'Please Enter valid Input' : null),
                    )),
              ),
              Container(
                width: 300,
                height: 55,
                child: RaisedButton(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: 15),
                      key: Key('continue-btn'),
                    ),
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: isEnable
                        ? () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultPage(widget.homebrew)));
                            });
                          }
                        : null),
              ),
            ]),
      ),
    );
  }
}

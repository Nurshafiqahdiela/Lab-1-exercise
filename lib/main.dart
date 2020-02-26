import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController _boxonecontroller = TextEditingController();
  final TextEditingController _boxtwocontroller = TextEditingController();
  final TextEditingController _boxthreecontroller = TextEditingController();
  final TextEditingController _boxfourcontroller = TextEditingController();

  int boxone, boxtwo, boxthree, boxfour, resultA = 0, resultB = 0;

  var operation = ['+', '-', 'x', '/'];

  var _currentOperation = '+';
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraction Calculator',
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Smart Calculator'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            Row(
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.pinkAccent[50],
                                filled: true,
                                border : OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _boxonecontroller,
                          )),
                      Divider(
                        color: Colors.blue,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.pinkAccent[50],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _boxtwocontroller,
                          )),
                    ],
                  ),
                ),
                Container(
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton<String>(
                      items: operation.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                      value: _currentOperation,
                    )),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.pinkAccent[50],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _boxthreecontroller,
                          )),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.pinkAccent[50],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _boxfourcontroller,
                          )),
                    ],
                  ),
                ),
                Text(
                  "=",
                  style: TextStyle(fontSize: 30),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text("$resultA"),
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text("$resultB"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  child: Text("Output"),
                  onPressed: _onPressed1,
                  color: Colors.black26,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  child: Text("Delete"),
                  onPressed: _onPressed2,
                  color: Colors.black26,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(80, 50, 25, 25),
                ),
              ],
              
            )
          
          ],
        )),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentOperation = newValueSelected;
    });
  }

  void _onPressed1() {
    setState(() {
      boxone = int.parse(_boxonecontroller.text);
      boxtwo = int.parse(_boxtwocontroller.text);
      boxthree = int.parse(_boxthreecontroller.text);
      boxfour = int.parse(_boxfourcontroller.text);
      if (_currentOperation == '+') {
        resultA = (boxone * boxfour) + (boxtwo * boxthree);
        resultB = boxtwo * boxfour;
      } else if (_currentOperation == '-') {
        resultA = (boxone * boxfour) - (boxtwo * boxthree);
        resultB = boxtwo * boxfour;
      } else if (_currentOperation == 'x') {
        resultA = boxone * boxthree;
        resultB = boxtwo * boxfour;
      } else if (_currentOperation == '/') {
        resultA = boxone * boxfour;
        resultB = boxtwo * boxthree;
      }
      for (int i = 2; i <= 100000; i++) {
        while (resultA % i == 0 && resultB % i == 0) {
          resultA = (resultA / i).round();
          resultB = (resultB / i).round();
        }
      }
   
    });
  }

  void _onPressed2() {
    setState(() {
      _boxonecontroller.text = "";
      _boxtwocontroller.text = "";
      _boxthreecontroller.text = "";
      _boxfourcontroller.text = "";
      resultA = 0;
      resultB = 0;
    
    });
  }

  

  
}
import 'package:flutter/material.dart';
import 'package:myapp/model/button.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textDisplay = '0';
  String res = '';
  String operation = '';

  handleEvent(btnVal) {
    // print(btnVal);
    if (btnVal == "AC") {
      firstNum = 0;
      secondNum = 0;
      history = '';
      textDisplay = '0';
      res = '0';
    } else if (btnVal == "+/-" && textDisplay != "0") {
      // print(textDisplay[0]);
      if (textDisplay[0] != "-") {
        res = '-' + textDisplay;
      } else {
        res = textDisplay.substring(1);
      }
    } else if (btnVal == ">") {
      res = textDisplay.substring(0, textDisplay.length - 1);
      if (res.length == 0) res = '0';
    } else if (btnVal == "+" ||
        btnVal == "- " ||
        btnVal == "X" ||
        btnVal == "/") {
      firstNum = int.parse(textDisplay);
      res = "";
      operation = btnVal;
    } else if (btnVal == "=") {
      secondNum = int.parse(textDisplay);
      if (operation == "+") {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == "-") {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == "X") {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == "/") {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else {
        history = textDisplay;
        res = textDisplay;
      }
    } else {
      res = int.parse(textDisplay + btnVal).toString();
    }

    setState(() {
      textDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 24.0, right: 16.0),
                child: Text(
                  history,
                  style: TextStyle(fontSize: 30.0, color: Colors.white54),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 24.0, right: 16.0),
                child: Text(
                  textDisplay,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    val: 'AC',
                    fillColor: 0xFF636363,
                    textColor: 0xFFFFFFFF,
                    textSize: 15.0,
                    Cb: handleEvent,
                  ),
                  Button(
                    val: '+/-',
                    fillColor: 0xFF636363,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                  Button(
                    val: '%',
                    fillColor: 0xFF636363,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                  Button(
                    val: '/',
                    fillColor: 0xFF995f06,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    val: '7',
                    Cb: handleEvent,
                  ),
                  Button(
                    val: '8',
                    Cb: handleEvent,
                  ),
                  Button(
                    val: '9',
                    Cb: handleEvent,
                  ),
                  Button(
                    val: 'X',
                    fillColor: 0xFF995f06,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(val: '4', Cb: handleEvent),
                  Button(val: '5', Cb: handleEvent),
                  Button(val: '6', Cb: handleEvent),
                  Button(
                      val: '-',
                      fillColor: 0xFF995f06,
                      textColor: 0xFFFFFFFF,
                      Cb: handleEvent),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(val: '1', Cb: handleEvent),
                  Button(val: '2', Cb: handleEvent),
                  Button(val: '3', Cb: handleEvent),
                  Button(
                    val: '+',
                    fillColor: 0xFF995f06,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    val: '>',
                    fillColor: 0xFF636363,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                  Button(val: '0', Cb: handleEvent),
                  Button(val: '.', Cb: handleEvent),
                  Button(
                    val: '=',
                    fillColor: 0xFF995f06,
                    textColor: 0xFFFFFFFF,
                    Cb: handleEvent,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

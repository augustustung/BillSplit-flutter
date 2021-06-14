import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String val;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function Cb;

  const Button(
      {required this.val,
      this.fillColor = 0xFF1f1f1f,
      this.textColor = 0xFF999999,
      this.textSize = 24.0,
      required this.Cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 70,
      height: 70,
      child: SizedBox(
        child: FlatButton(
          color: Color(fillColor),
          onPressed: () => Cb(val),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            val,
            style: TextStyle(
                fontSize: 24.0,
                color: Color(textColor),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

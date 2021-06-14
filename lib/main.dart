import 'package:flutter/material.dart';
import 'package:myapp/components/calculator.dart';

import 'components/billspit.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter App",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://c8.alamy.com/comp/T7CE3A/notebook-coffee-calculator-tablet-over-wooden-background-planning-concept-vertical-toned-photo-T7CE3A.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white60,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Welcome to calculator app!".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()))
                  },
                  child: Container(
                      margin: const EdgeInsets.all(32.0),
                      alignment: Alignment.center,
                      color: Colors.blueAccent.shade200,
                      width: 100.0,
                      height: 50.0,
                      child: Text(
                        "Calculator",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BillSplit()))
                  },
                  child: Container(
                      margin: const EdgeInsets.all(32.0),
                      alignment: Alignment.center,
                      color: Colors.blueAccent.shade200,
                      width: 100.0,
                      height: 50.0,
                      child: Text("Bill Split",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

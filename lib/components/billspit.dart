import 'package:flutter/material.dart';

class BillSplit extends StatefulWidget {
  @override
  _BillSplitState createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill Split"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent.shade100,
      ),
      body: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent.shade100.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total Per Person",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.deepPurple)),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                            "\$ ${_caculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          prefixText: "Bill Amount: ",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (err) {
                          print(err);
                          _billAmount = 0.0;
                        }
                      },
                    ),
                    Divider(thickness: 0.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Split",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () => {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  }
                                })
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color:
                                        Colors.purpleAccent.withOpacity(0.2)),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              "$_personCounter",
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => {
                                setState(() {
                                  _personCounter++;
                                })
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color:
                                        Colors.purpleAccent.withOpacity(0.2)),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.purpleAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Tip",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "\$ ${(_caculateTotalTip(_tipPercentage, _billAmount, _personCounter).toStringAsFixed(2))}",
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("$_tipPercentage%",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Slider(
                      min: 0,
                      max: 100,
                      activeColor: Colors.purpleAccent.shade400,
                      inactiveColor: Colors.grey,
                      divisions: 10,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double newVal) {
                        setState(() {
                          _tipPercentage = newVal.round();
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  _caculateTotalPerPerson(
      double billAmount, int billSplitBy, int tipPersentage) {
    var totalPerPerson =
        (_caculateTotalTip(tipPersentage, billAmount, billSplitBy) +
                billAmount) /
            billSplitBy.toDouble();
    return totalPerPerson.toStringAsFixed(2);
  }

  _caculateTotalTip(int tipPecentage, double billAmount, int billSplitBy) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      return null;
    } else {
      totalTip = (billAmount * tipPecentage.toDouble()) / 100;
    }

    return totalTip;
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = ['Dollars', 'Euros', 'Pound'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Cost Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: TextField(
                controller: distanceController,
                decoration: InputDecoration(
                  hintText: 'e.g. 124',
                  labelText: 'Distance',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                /* onChanged: (String string) => setState(() {
                  name = string;
                }), */
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                  hintText: 'e.g. 17',
                  labelText: 'Distance per Unit',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: 'e.g. 1.65',
                      labelText: 'Price',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(width: _formDistance * 5),
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _currency,
                    onChanged: (String value) {
                      _onDropdownChanged(value);
                    },
                  ),
                ),
              ]),
            ),
            Row(children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                  child: Text(
                    "Submit",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              Container(
                width: _formDistance,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColorLight),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColorDark),
                  ),
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: Text(
                    "Reset",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ]),
            Text(result)
          ],
        ),
      ),
    );
  }

  void _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return result;
  }

  void _reset() {
    avgController.text = '';
    distanceController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}

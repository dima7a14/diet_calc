import 'package:flutter/material.dart';

import './common.dart';
import './models/measurement.dart';
import './widgets/measurement_item.dart';

void main() {
  runApp(DietApp());
}

class DietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Measurement> measurements = [
    Measurement(
        id: '1',
        name: 'Ana',
        sex: Sex.female,
        weight: 72,
        height: 165,
        activity: Activity.average,
        age: 28),
    Measurement(
        id: '2',
        name: 'Dima',
        sex: Sex.male,
        weight: 75,
        height: 169,
        activity: Activity.minimal,
        age: 29),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
            ),
          ),
          Column(
            children: measurements.map((ms) => MeasurementItem(ms)).toList(),
          ),
        ],
      ),
    );
  }
}

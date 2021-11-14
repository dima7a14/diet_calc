import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './models/common.dart';
import './models/measurement.dart';
import './widgets/measurement_list.dart';
import './widgets/new_measurement.dart';

void main() {
  runApp(DietApp());
}

const uuid = Uuid();

class DietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Calculator',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey.shade300),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Measurement> _userMeasurements = [
    Measurement(
        id: uuid.v4(),
        name: 'Ana',
        sex: Sex.female,
        weight: 72,
        height: 165,
        activity: Activity.average,
        age: 28),
    Measurement(
        id: uuid.v4(),
        name: 'Dima',
        sex: Sex.male,
        weight: 75,
        height: 169,
        activity: Activity.minimal,
        age: 29),
  ];

  void _addMeasurement(String name, Sex sex, double weight, double height,
      int age, Activity activity) {
    final newMeasurement = Measurement(
        id: uuid.v4(),
        name: name,
        sex: sex,
        weight: weight,
        height: height,
        age: age,
        activity: activity);

    setState(() {
      _userMeasurements.add(newMeasurement);
    });
  }

  void startAddNewMeasurement(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewMeasurement(_addMeasurement);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Calculator'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => startAddNewMeasurement(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('Chart'),
              ),
            ),
            MeasurementList(_userMeasurements),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => startAddNewMeasurement(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

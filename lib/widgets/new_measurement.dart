import 'package:flutter/material.dart';

import '../models/common.dart';

class NewMeasurement extends StatefulWidget {
  final void Function(
    String name,
    Sex sex,
    double weight,
    double height,
    int age,
    Activity activity,
  ) addMeasurement;

  const NewMeasurement(this.addMeasurement, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewMeasurementState();
}

class _NewMeasurementState extends State<NewMeasurement> {
  final nameController = TextEditingController();
  Sex _sex = Sex.male;
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  Activity _activity = Activity.average;

  void _handleSexChange(Sex? value) {
    if (value != null) {
      setState(() {
        _sex = value;
      });
    }
  }

  void _handleActivityChange(Activity? value) {
    if (value != null) {
      setState(() {
        _activity = value;
      });
    }
  }

  void submitData() {
    final enteredName = nameController.text;
    final enteredWeight = weightController.text;
    final enteredHeight = heightController.text;
    final enteredAge = ageController.text;

    if (enteredName.isEmpty ||
        enteredWeight.isEmpty ||
        enteredHeight.isEmpty ||
        enteredAge.isEmpty) {
      return;
    }

    widget.addMeasurement(
      enteredName,
      _sex,
      double.parse(enteredWeight),
      double.parse(enteredHeight),
      int.parse(enteredAge),
      _activity,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            const Text(
              'Add new measurement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              controller: nameController,
              onSubmitted: (_) => submitData(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                width: double.infinity,
                child: const Text(
                  'Sex',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Radio<Sex>(
                  value: Sex.male,
                  groupValue: _sex,
                  onChanged: _handleSexChange,
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<Sex>(
                  value: Sex.female,
                  groupValue: _sex,
                  onChanged: _handleSexChange,
                ),
                const Text('Female'),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight'),
              controller: weightController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height'),
              controller: heightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
              controller: ageController,
            ),
            DropdownButton<Activity>(
              value: _activity,
              hint: const Text('Activity'),
              onChanged: _handleActivityChange,
              items: Activity.values.map((Activity value) {
                return DropdownMenuItem(value: value, child: Text(value.name));
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('Add measurement'),
                    onPressed: submitData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

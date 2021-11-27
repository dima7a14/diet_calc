import 'package:flutter/material.dart';

import '../models/common.dart';
import '../utils/get_calorie_level.dart';

class Values extends StatefulWidget {
  const Values({Key? key}) : super(key: key);

  @override
  _ValuesState createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  Sex _sex = Sex.male;
  Activity _activity = Activity.average;
  int calories = 0;

  void _handleSexChange(Sex? value) {
    if (value != null) {
      setState(() {
        _sex = value;
      });

      _calculateCalories();
    }
  }

  void _handleActivityChange(Activity? value) {
    if (value != null) {
      setState(() {
        _activity = value;
      });

      _calculateCalories();
    }
  }

  void _calculateCalories() {
    final rawWeight = weightController.text;
    final rawHeight = heightController.text;
    final rawAge = ageController.text;

    setState(() {
      if (rawWeight.isEmpty || rawHeight.isEmpty || rawAge.isEmpty) {
        calories = 0;
      } else {
        calories = getCalorieLevel(_sex, double.parse(rawWeight),
            double.parse(rawHeight), int.parse(rawAge), _activity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Your daily calories level'),
            Text(
              calories.toString(),
              style: const TextStyle(
                fontFamily: 'Kalam',
                fontSize: 64,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      decoration: const InputDecoration(labelText: 'Weight'),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      onChanged: (_) => _calculateCalories(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Height'),
                        textAlign: TextAlign.center,
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _calculateCalories()),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Age'),
                        textAlign: TextAlign.center,
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _calculateCalories()),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButton<Sex>(
                      value: _sex,
                      hint: const Text('Sex'),
                      onChanged: _handleSexChange,
                      items: Sex.values.map((Sex value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value.name));
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButton<Activity>(
                      value: _activity,
                      hint: const Text('Activity'),
                      onChanged: _handleActivityChange,
                      items: Activity.values.map((Activity value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value.name));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

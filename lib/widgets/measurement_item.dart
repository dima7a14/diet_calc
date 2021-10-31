import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/measurement.dart';
import '../utils/get_calorie_level.dart';

class MeasurementItem extends StatelessWidget {
  final Measurement data;

  MeasurementItem(this.data);

  @override
  Widget build(BuildContext context) {
    int calorieLevel = getCalorieLevel(
        data.sex, data.weight, data.height, data.age, data.activity);

    return Card(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              child: Text(
                calorieLevel.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(DateFormat('yyyy-MM-dd HH:mm').format(data.date),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey.shade500,
                  ))
            ],
          )),
        ],
      ),
    );
  }
}

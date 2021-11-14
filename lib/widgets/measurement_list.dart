import 'package:flutter/material.dart';

import '../models/measurement.dart';
import './measurement_item.dart';

class MeasurementList extends StatelessWidget {
  final List<Measurement> measurements;

  const MeasurementList(this.measurements, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: measurements.map((measurement) {
        return MeasurementItem(data: measurement);
      }).toList(),
    );
  }
}

import './common.dart';

class Measurement {
  final String id;
  final String name;
  final Sex sex;
  final double weight;
  final double height;
  final int age;
  final Activity activity;
  final DateTime date = DateTime.now();

  Measurement(
      {required this.id,
      required this.name,
      required this.sex,
      required this.weight,
      required this.height,
      required this.age,
      required this.activity});
}

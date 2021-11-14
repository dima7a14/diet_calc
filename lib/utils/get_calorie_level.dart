import '../models/common.dart';

int getCalorieLevel(
    Sex sex, double weight, double height, int age, Activity activity) {
  int constVal;

  switch (sex) {
    case Sex.male:
      constVal = 5;
      break;
    case Sex.female:
      constVal = -131;
      break;
    default:
      constVal = 0;
  }

  return (activity.value * (10 * weight + 6.25 * height + 5 * age + constVal))
      .round();
}

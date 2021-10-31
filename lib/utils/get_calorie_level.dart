import '../common.dart';

int getCalorieLevel(
    Sex sex, double weight, double height, int age, Activity activity) {
  int constVal;
  double activityVal;

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

  switch (activity) {
    case Activity.minimal:
      activityVal = 1.2;
      break;
    case Activity.weak:
      activityVal = 1.375;
      break;
    case Activity.average:
      activityVal = 1.55;
      break;
    case Activity.high:
      activityVal = 1.725;
      break;
    case Activity.extra:
      activityVal = 1.9;
      break;
    default:
      activityVal = 1;
  }

  return (activityVal * (10 * weight + 6.25 * height + 5 * age + constVal))
      .round();
}

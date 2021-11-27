enum Sex {
  male,
  female,
}

extension SexExtension on Sex {
  String get name {
    switch (this) {
      case Sex.male:
        return 'Male';
      case Sex.female:
        return 'Female';
    }
  }
}

enum Activity {
  minimal,
  weak,
  average,
  high,
  extra,
}

extension ActivityExtension on Activity {
  String get name {
    switch (this) {
      case Activity.minimal:
        return 'Minimal activity';
      case Activity.weak:
        return 'Weak activity';
      case Activity.average:
        return 'Average activity';
      case Activity.high:
        return 'High activity';
      case Activity.extra:
        return 'Extra activity';
    }
  }

  double get value {
    switch (this) {
      case Activity.minimal:
        return 1.2;
      case Activity.weak:
        return 1.375;
      case Activity.average:
        return 1.55;
      case Activity.high:
        return 1.725;
      case Activity.extra:
        return 1.9;
    }
  }
}

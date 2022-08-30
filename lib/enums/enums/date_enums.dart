
enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  november,
  december
}

extension FormExtensionMonth on Month {

  String get getMonthName {
    switch (this) {
      case Month.january:
        return "Jan";
      case Month.february:
        return "Feb";
      case Month.march:
        return "Mar";
      case Month.april:
        return "Apr";
      case Month.may:
        return "May";
      case Month.june:
        return "Jun";
      case Month.july:
        return "Jul";
      case Month.august:
        return "Aug";
      case Month.september:
        return "Sep";
      case Month.november:
        return "Nov";
      case Month.december:
        return "Dec";
    }
  }
}


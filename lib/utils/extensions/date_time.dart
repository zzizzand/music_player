extension DateFormatter on DateTime {
  String get timeFormat {
    var res = "";
    if (hour != 0) res = "$hour:";
    if (minute > 10)
      res += "$minute:";
    else if (minute > 0) res += "0$minute:";
    if (second >= 10)
      res += "$second";
    else
      res += "0$second";
    return res;
  }
}

extension NumberFormatter on int {
  String get timeFormat => DateTime.fromMillisecondsSinceEpoch(this).timeFormat;
}

extension StringFormatter on String {
  String get timeFormat => int.parse(this).timeFormat;
}

import 'package:intl/intl.dart';

class getTime {
  String readTime(int timeStamp) {
    var now = DateTime.now();
    var format = DateFormat('hh:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    return format.format(date);
  }
}
import 'package:intl/intl.dart';

class getTime {
  String readTime(int timeStamp) {
    var now = DateTime.now();
    var format = DateFormat('hh:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    return format.format(date);
  }

  List<String> getCity() {
    final List<String> cities = [
      'Dhaka',
      'Rajshahi',
      'Khulna',
      'Sirajganj',
      'Chattogram',
      'Sylhet',
      'Rangpur',
      'Mymensingh',
      'Barishal',
      'Cumilla',
      'Narayanganj',
      'Gazipur',
      'Salanga',
      'Ullapara',
      'Pabna',
      'Bogra',
      'Naogaon',
      'Kushtia',
      'Kolkata',
      'Delhi'
    ];
    return cities;
  }
}
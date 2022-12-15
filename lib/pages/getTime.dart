import 'package:intl/intl.dart';

class getTime {
  String readTime(int timeStamp) {
    var now = DateTime.now();
    var format = DateFormat('hh:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    return format.format(date);
  }

  String getDay(String date) {
    //var now = DateTime.now();
    //var format = DateFormat("dd-mm-yyyy");
    //String date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000).toString();
    String subDate = date.substring(1, 11);
    return DateFormat('EEEE').format(DateTime.parse(subDate));
  }

  List<String> getCity() {
    final List<String> cities = [
      'Dhaka',
      'Rajshahi',
      'Khulna',
      'Sirajganj',
      'Sylhet',
      'Rangpur',
      'Mymensingh',
      'Narayanganj',
      'Gazipur',
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
import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 150,
          color: Colors.yellow,
          child: Text(
            "Sun"
          ),
        ),
        Container(
          width: 150,
          color: Colors.purple,
          child: Text(
            "Mon",
          ),
        ),
        Container(
          width: 150,
          color: Colors.red,
          child: Text(
            "Tue",
          ),
        ),
        Container(
          width: 150,
          color: Colors.orange,
          child: Text(
            "Wed",
          ),
        ),
        Container(
          width: 150,
          color: Colors.blue,
          child: Text(
            "Thu",
          ),
        ),
        Container(
          width: 150,
          color: Colors.green,
          child: Text(
            "Fri",
          ),
        ),
        Container(
          width: 150,
          color: Colors.black,
          child: Text(
            "Sat",
          ),
        ),
      ],
    );
  }
}

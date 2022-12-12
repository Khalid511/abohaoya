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
         // color: Colors.yellow,
          child: Text(
            "Sun"
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Mon",
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Tue",
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Wed",
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Thu",
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Fri",
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Text(
            "Sat",
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ],
    );
  }
}

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sun",
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                  child: Text(
                    "View",
                  ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mon",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.limeAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                child: Text(
                  "View",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Tue",
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                child: Text(
                  "View",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wed",
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                child: Text(
                  "View",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Thu",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                child: Text(
                  "View",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Fri",
                style: TextStyle(
                  color: Colors.yellowAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(onPressed: (){

              },
                child: Text(
                  "View",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        // Container(
        //   width: 150,
        //   child: Text(
        //     "Sat",
        //     style: TextStyle(
        //       color: Colors.white,
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //     borderRadius: BorderRadius.all(Radius.circular(100)),
        //   ),
        // ),
      ],
    );
  }
}

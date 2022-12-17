import 'package:flutter/material.dart';

class ForecastList extends StatefulWidget {
  var maxtem1, mintemp1, day1,
      maxtem2, mintemp2, day2,
      maxtem3, mintemp3, day3,
      maxtem4, mintemp4, day4;
  var description1, description2, description3, description4;
  ForecastList(this.maxtem1, this.mintemp1, this.day1,
      this.maxtem2, this.mintemp2, this.day2,
      this.maxtem3, this.mintemp3, this.day3,
      this.maxtem4, this.mintemp4, this.day4,
      this.description1, this.description2, this.description3, this.description4);

  @override
  State<ForecastList> createState() => _ForecastList();
}

class _ForecastList extends State<ForecastList> {
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
                widget.day1!=null?widget.day1:"Load",
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.maxtem1!=null? widget.mintemp1+"/"+widget.maxtem1+"\u00B0C" : "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.description1!=null ? widget.description1 : "Load",
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
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue,
                Colors.yellow,
              ]
            ),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.day2!=null?widget.day2:"Load",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.maxtem2!=null? widget.mintemp2+"/"+widget.maxtem2+"\u00B0C" : "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.description2!=null ? widget.description2 : "Load",
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
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey,
                  Colors.purple,
                ]
            ),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.day3!=null?widget.day3:"Load",
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.maxtem3!=null? widget.mintemp3+"/"+widget.maxtem3+"\u00B0C" : "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.description3!=null ? widget.description3 : "Load",
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
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.yellowAccent,
                  Colors.red,
                ]
            ),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.day4!=null?widget.day4:"Load",
                style: TextStyle(
                  color: Colors.yellowAccent,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.maxtem4!=null? widget.mintemp4+"/"+widget.maxtem4+"\u00B0C" : "Min / Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                widget.description4!=null ? widget.description4 : "Load",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
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
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purple,
                  Colors.orange,
                ]
            ),
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

import 'package:flutter/material.dart';
import 'package:abohaoya/pages/ForecastList.dart';

class ForecastDayOne extends StatefulWidget {
  var pressure1, humidity1, maxtem1, mintem1, weatherMain1, icon1, windSpeed1, visibility1, day;
  ForecastDayOne(this.pressure1, this.humidity1, this.maxtem1, this.mintem1, this.weatherMain1,
      this.icon1, this. windSpeed1, this.visibility1, this.day) ;

  @override
  State<ForecastDayOne> createState() => _ForecastDayOneState();
}

class _ForecastDayOneState extends State<ForecastDayOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.day+" Weather",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 70), ),
          Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
            // child: Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.blueAccent,
                ]
              )
            ),
              //color: Colors.amberAccent,
              child: Padding(padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("http://openweathermap.org/img/wn/"+widget.icon1+"@2x.png"),
                        Text("Description"),
                        Padding(padding: EdgeInsets.all(2)),
                        Text(
                          widget.weatherMain1!=null? widget.weatherMain1 : "Load",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 80)),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/temperature.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,),
                            Text("Maximum Temperature"),
                            Padding(padding: EdgeInsets.all(2.0),),
                            Text(
                              widget.maxtem1!=null ? widget.maxtem1+"\u00B0C" : "Load",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(right: 70)),
                        Column(
                          children: [
                            Image.asset("assets/images/feels_like.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,),
                            Text("Minimum Temperature"),
                            Text(
                              widget.mintem1!=null ? widget.mintem1+"\u00B0C" : "Load",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                           ),
                         ],
                        ),
                        ],
                   ),
                    Padding(padding: EdgeInsets.only(bottom: 50)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(right: 40)),
                        Column(
                          children: [
                            Image.asset("assets/images/icons8-pressure-96.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,),
                            Text("Pressure bar"),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              widget.pressure1!=null ? widget.pressure1+"hpa" : "Load",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                              
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(right: 125)),
                        Column(
                          children: [
                            Image.asset("assets/images/humidity.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,),
                            Text("Humidity Scale"),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              widget.humidity1!=null ? widget.humidity1+"%" : "Load",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 50)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(right: 45)),
                        Column(
                          children: [
                            Image.asset("assets/images/icons8-windsurfing-80.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,),
                            Text("Wind Speed"),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              widget.windSpeed1!=null ? widget.windSpeed1+"m/s" : "Load",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(right: 145)),
                        Column(
                          children: [
                            Icon(Icons.remove_red_eye,),
                            Text("Visibility"),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              widget.visibility1!=null ? widget.visibility1+"m" : "Load",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    
                  ],
                ),

              ),
           // ),
          )
        ],
      ),
    );
  }
}

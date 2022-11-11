import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String lat = '24.45', lon = '89.7167', cityName = 'Sirajganj';
  var temp, realFeel, humidity, windSpeed, weatherDescription, pressure, sunrise, sunset;

  void getLocation() async{
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if(locationPermission==LocationPermission.denied || locationPermission==LocationPermission.deniedForever) {
      LocationPermission get = await Geolocator.requestPermission();
    }
    else {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      setState(() {
        this.lon = position.longitude.toString();
        this.lat = position.latitude.toString();

      });
      // print("long on loc = "+long);
      // print("lat on loc" +lat);
    }
  }

  Future getWeather() async{
    //print("lat = "+lat);
    //print("lon = "+lon);
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&units=metric&appid=382c950e1e150b70392101ded43e7739"));
    var results = jsonDecode(response.body);
    setState(() {
      cityName = results['name'];
      temp = results['main']['temp'].toString();
      realFeel = results['main']['feels_like'].toString();
      humidity = results['main']['humidity'].toString();
      windSpeed = results['wind']['speed'].toString();
      weatherDescription = results['weather'][0]['description'].toString();
      pressure = results['main']['pressure'].toString();
      //sunrise = results['sys']['sunrise'];
      //sunset = results['sys']['sunset'];
    });
    print("lat = "+lat);
    print("lon = "+lon);
    print("temp = "+temp);
  }



  @override
  void initState() {
    // TODO: implement initState
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('আবহাওয়া দেখুন',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    getLocation();
                    getWeather();
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                    ),
                    child: Text('Turn on location', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),),),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 210.0,
                child: Padding(padding: EdgeInsets.all(2.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.yellow,
                  child: Padding(padding: EdgeInsets.all(20.0),
                    child: Row(
                  children: <Widget>[
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Padding(padding: EdgeInsets.all(20.0),),
                      Image.asset("assets/images/location.png",
                      height: 25.0,
                      width: 25.0,
                      fit: BoxFit.cover,),
                      Text('Location'),
                      Padding(padding: EdgeInsets.only(bottom: 10.0),),
                      Text(
                        cityName,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.all(15.0),),
                    ],
                  ),
                    Padding(padding: EdgeInsets.all(80.0),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/temperature.png",
                          height: 25.0,
                          width: 25.0,
                          fit: BoxFit.cover,),
                        Text('Temperature'),
                        Padding(padding: EdgeInsets.only(bottom: 10.0), ),
                        Text(
                          temp!=null? temp+"\u00B0C":"Load...",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                           // color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    )
                    ],
                ),
                  ),
                ),
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.lightBlueAccent,
                  child: Padding(padding: EdgeInsets.all(20.0),
                    child: Column(
                    children: [
                      Row(
                        children: [
                          Text('jhsfhksfd')
                        ],
                      )
                    ],
                  ),
                  ),
                ),

                  ),
            ],
          ),
    );
  }
}

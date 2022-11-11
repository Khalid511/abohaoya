import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String lat = '24.45', lon = '89.7167', cityName = 'Sirajganj';

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

  void getWeather() {
    print("lat = "+lat);
    print("lon = "+lon);
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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.black26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "temp\u00B0C",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}

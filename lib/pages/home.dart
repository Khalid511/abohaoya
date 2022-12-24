import 'dart:convert';

import 'package:abohaoya/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:abohaoya/pages/getTime.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:abohaoya/pages/ForecastList.dart';
import 'package:flutter/services.dart' ;
import 'package:flutter_switch/flutter_switch.dart';
import 'package:abohaoya/main.dart';
import 'package:flutter_custom_switch/flutter_custom_switch.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String lat = '', lon = '', cityName = 'Sirajganj', selectedCity = 'Sirajganj';
  var temp, realFeel, humidity, windSpeed, weatherDescription, pressure, sunrise, sunset, descriptionIcon;
  var maxtem1, mintemp1, date1;
  var maxtem2, mintemp2, date2;
  var maxtem3, mintemp3, date3;
  var maxtem4, mintemp4, date4;
  var maxtem5, mintemp5, date5;
  var maxtem6, mintemp6, date6;
  var description1, description2, description3, description4;
  var pressure1, pressure2, pressure3, pressure4, humidity1, humidity2, humidity3, humidity4, icon1, icon2, icon3, icon4,
  weatherMain1, weatherMain2, weatherMain3, weatherMain4, windSpeed1, windSpeed2, windSpeed3, windSpeed4,
  visibility1, visibility2, visibility3, visibility4;
  var dateTime = new getTime();
  bool isLocation = false;
  String? selectedValue;

  void getLocation() async{
      LocationPermission locationPermission = await Geolocator.checkPermission();
      if(locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        LocationPermission get = await Geolocator.requestPermission();
      }
      else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        setState(() {
          this.lon = position.longitude.toString();
          this.lat = position.latitude.toString();
          //found = true;
        });
        //return true;
        // print("long on loc = "+long);
        // print("lat on loc" +lat);
      }
      // print("found= "+found.toString());
      // print("lat = "+lat);
      // print("lon = "+lon);
    }

  Future getWeather() async{
    //print("lat = "+lat);
    //print("lon = "+lon);
    //String url = "http://api.weatherapi.com/v1/forecast.json?key=26a57fa5b5094766a2c53809221412 &q="+selectedCity+"&days=7&aqi=yes&alerts=no";
    String url = "https://api.openweathermap.org/data/2.5/forecast?q="+selectedCity+"&units=metric&appid=382c950e1e150b70392101ded43e7739";
    if(isLocation)
      url = "https://api.openweathermap.org/data/2.5/forecast?lat="+lat+"&lon="+lon+"&units=metric&appid=382c950e1e150b70392101ded43e7739";
    // if(isLocation)
    //   url = "http://api.weatherapi.com/v1/forecast.json?key=26a57fa5b5094766a2c53809221412 &q="+lat+","+lon+"&days=7&aqi=yes&alerts=no";
    http.Response response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);
    setState(() {
      cityName = results['city']['name'];
      temp = results['list'][0]['main']['temp'].toString();
      realFeel = results['list'][0]['main']['feels_like'].toString();
      humidity = results['list'][0]['main']['humidity'].toString();
      windSpeed = results['list'][0]['wind']['speed'].toString();
      weatherDescription = results['list'][0]['weather'][0]['description'];
      //descriptionIcon = results['current']['condition']['icon'];
    //weatherDescription = results['weather'][0]['description'].toString();
      pressure = results['list'][0]['main']['pressure'].toString();
      sunrise = dateTime.readTime(results['city']['sunrise']);
      sunset = dateTime.readTime(results['city']['sunset']);

      maxtem1 = results['list'][10]['main']['temp_max'].toString();
      mintemp1 = results['list'][10]['main']['temp_min'].toString();
      date1 = dateTime.getDay(results['list'][10]['dt_txt']);
      maxtem2 = results['list'][18]['main']['temp_max'].toString();
      mintemp2 = results['list'][18]['main']['temp_min'].toString();
      date2 = dateTime.getDay(results['list'][18]['dt_txt']);
      maxtem3 = results['list'][26]['main']['temp_max'].toString();
      mintemp3 = results['list'][26]['main']['temp_min'].toString();
      date3 = dateTime.getDay(results['list'][26]['dt_txt']);
      maxtem4 = results['list'][34]['main']['temp_max'].toString();
      mintemp4 = results['list'][34]['main']['temp_min'].toString();
      date4 = dateTime.getDay(results['list'][34]['dt_txt']);
      description1 = results['list'][10]['weather'][0]['description'];
      description2 = results['list'][18]['weather'][0]['description'];
      description3 = results['list'][26]['weather'][0]['description'];
      description4 = results['list'][34]['weather'][0]['description'];
      pressure1 = results['list'][10]['main']['pressure'].toString();
      pressure2 = results['list'][18]['main']['pressure'].toString();
      pressure3 = results['list'][26]['main']['pressure'].toString();
      pressure4 = results['list'][34]['main']['pressure'].toString();
      humidity1 = results['list'][10]['main']['humidity'].toString();
      humidity2 = results['list'][18]['main']['humidity'].toString();
      humidity3 = results['list'][26]['main']['humidity'].toString();
      humidity4 = results['list'][34]['main']['humidity'].toString();
      weatherMain1 = results['list'][10]['weather'][0]['main'];
      weatherMain2 = results['list'][18]['weather'][0]['main'];
      weatherMain3 = results['list'][26]['weather'][0]['main'];
      weatherMain4 = results['list'][34]['weather'][0]['main'];
      icon1 = results['list'][10]['weather'][0]['icon'];
      icon2 = results['list'][18]['weather'][0]['icon'];
      icon3 = results['list'][26]['weather'][0]['icon'];
      icon4 = results['list'][34]['weather'][0]['icon'];
      windSpeed1 = results['list'][10]['wind']['speed'].toString();
      windSpeed2 = results['list'][18]['wind']['speed'].toString();
      windSpeed3 = results['list'][26]['wind']['speed'].toString();
      windSpeed4 = results['list'][34]['wind']['speed'].toString();
      visibility1 = results['list'][10]['visibility'].toString();
      visibility2 = results['list'][18]['visibility'].toString();
      visibility3 = results['list'][26]['visibility'].toString();
      visibility4 = results['list'][34]['visibility'].toString();
    });
    print("temp = "+temp);
    //print("found= "+found.toString());
    print("lat = "+lat);
    print("lon = "+lon);
    print(date1.toString().substring(0, 11));
    //print("Days: "+date1+" "+date2+" "+date3+" "+date4+" "+date5+" "+date6);
  }


  void changedCity(){
    setState(() {
      isLocation = false;
    });
  }
  void changeLoc(){
    isLocation = true;
    selectedValue = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    getWeather();
  }
  bool status = false;

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
          actions: [
            PopupMenuButton(
                itemBuilder: (context) =>
                    [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Text("Theme"),
                            Padding(padding: EdgeInsets.only(right: 10),),
                            FlutterSwitch(
                              value: status,
                              valueFontSize: 16.0,
                              width: 60,
                              height: 25,
                              borderRadius: 30.0,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                                if(status) {
                                  MyApp.of(context).changeThemeMode(ThemeMode.light);
                                }
                                else
                                  MyApp.of(context).changeThemeMode(ThemeMode.dark);
                              },
                              showOnOff: true,
                              activeColor: Colors.green,
                              inactiveColor: Colors.red,
                            ),
                          ],
                        ),),
                      PopupMenuItem(
                        value: 2,
                          child: Row(
                        children: [
                          Icon(Icons.chrome_reader_mode),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("About"),
                        ],
                      )),
                    ],
              offset: Offset(0, 100),
              color: Colors.pinkAccent.shade100,
              //elevation: 2,
            ),
          ],
        ),
        body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Select city'
                        ),
                        items: dateTime.getCity().map((city) => 
                        DropdownMenuItem<String>(
                          value: city,
                          child: Text(
                            city, style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        ).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            selectedCity = selectedValue.toString();
                            changedCity();
                          });
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    getLocation();
                    changeLoc();
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade900,
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
                  //Colors.amberAccent.shade400
                  color: Colors.amberAccent.shade400,
                  child: Padding(padding: EdgeInsets.all(15.0),
                    child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(right: 90.0),),
                        ElevatedButton(onPressed: (){
                          getWeather();
                        },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amberAccent.shade400
                            ),
                            child: Text(
                              'GET WEATHER',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade400
                              ),
                            ))
                      ],
                    ),
                    Row(
                    children: [
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
                    Padding(padding: EdgeInsets.only(right: cityName.length<10? 60.0 : 0.0), ),
                    Padding(padding: EdgeInsets.all(60.0),),
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
                    ),
                  ],
                    ),
                    ],
                ),
                  ),
                ),
                ),
              ),
              Container(
                height: 480,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.white38,
                  child: Padding(padding: EdgeInsets.all(10.0),
                    child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 15.0),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 20.0)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/description.png",
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.cover,),
                              Text("Weather description"),
                              Padding(padding: EdgeInsets.all(2.0),),
                              Text(
                                weatherDescription!=null?weatherDescription:"Load...",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 45.0),),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 20.0), ),
                          Column(
                            children: <Widget>[
                              Image.asset("assets/images/icons8-dew-point-80.png",
                              height: 25.0,
                              width: 25.0,
                              fit: BoxFit.cover,),
                              Text('Real feeling'),
                              Padding(padding: EdgeInsets.all(2.0),),
                              Text(
                                realFeel!=null? realFeel+"\u00B0C":"Load...",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 145.0), ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/humidity.png",
                              height: 25.0,
                              width: 25.0,
                              fit: BoxFit.cover,),
                              Text("Humidity Scale"),
                              Padding(padding: EdgeInsets.all(2.0),),
                              Text(
                                humidity!=null?humidity+"%":"Load...",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 45.0), ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 20.0), ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/icons8-windsurfing-80.png",
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.cover,
                              ),
                              Text("Wind speed"),
                              Padding(padding: EdgeInsets.all(2.0), ),
                              Text(
                                windSpeed!=null?windSpeed+"m/s":"Load...",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 145.0), ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/icons8-pressure-96.png",
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.cover,
                              ),
                              Text('Pressure bar'),
                              Padding(padding: EdgeInsets.only(bottom: 2.0), ),
                              Text(
                                pressure!=null?pressure+"hPa":"Load...",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 45.0), ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 20.0), ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Padding(padding: EdgeInsets.only(right: 7.0), ),
                              Image.asset("assets/images/sunrise.png",
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.cover,
                              ),
                              Text("Sunrise time"),
                              Padding(padding: EdgeInsets.only(bottom: 2.0),),
                              Text(
                                sunrise!=null?sunrise:"Load...",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 145.0), ),
                          Column(
                            children: [
                              Image.asset("assets/images/sunset.png",
                                height: 25.0,
                                width: 25.0,
                                fit: BoxFit.cover,
                              ),
                              Text("Sunset time"),
                              Padding(padding: EdgeInsets.only(bottom: 2.0), ),
                              Text(
                                sunset!=null?sunset:"Load...",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ),
                ),

                  ),
              Container(
                height: 200,
                 child:  ForecastList(maxtem1, mintemp1, date1,
                     maxtem2, mintemp2, date2,
                     maxtem3, mintemp3, date3,
                     maxtem4, mintemp4, date4,
                     description1, description2, description3, description4,
                     pressure1, pressure2, pressure3, pressure4,
                     humidity1, humidity2, humidity3, humidity4,
                   weatherMain1, weatherMain2, weatherMain3, weatherMain4,
                   icon1, icon2, icon3, icon4,
                   windSpeed1, windSpeed2, windSpeed3, windSpeed4,
                   visibility1, visibility2, visibility3, visibility4),
                //width: MediaQuery.of(context).size.width,
                //color: Colors.orange,
              )
            ],
          ),
    ),
    );
  }
}

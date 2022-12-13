import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:abohaoya/pages/getTime.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:abohaoya/pages/ForecastList.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String lat = '', lon = '', cityName = 'Sirajganj', selectedCity = 'Sirajganj';
  var temp, realFeel, humidity, windSpeed, weatherDescription, pressure, sunrise, sunset;
  var maxtem1, mintemp1, date1;
  var maxtem2, mintemp2, date2;
  var maxtem3, mintemp3, date3;
  var maxtem4, mintemp4, date4;
  var maxtem5, mintemp5, date5;
  var maxtem6, mintemp6, date6;
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
    String url = "http://api.weatherapi.com/v1/forecast.json?key=23e30e09626240998a133605222011 &q="+selectedCity+"&days=7&aqi=yes&alerts=no";
    // String url = "https://api.openweathermap.org/data/2.5/weather?q="+selectedCity+"&units=metric&appid=382c950e1e150b70392101ded43e7739";
    // if(isLocation)
    //   url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&units=metric&appid=382c950e1e150b70392101ded43e7739";
    if(isLocation)
      url = "http://api.weatherapi.com/v1/forecast.json?key=23e30e09626240998a133605222011 &q="+lat+","+lon+"&days=7&aqi=yes&alerts=no";
    http.Response response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);
    setState(() {
      cityName = results['location']['name'];
      temp = results['current']['temp_c'].toString();
      //realFeel = results['main']['feels_like'].toString();
      //humidity = results['main']['humidity'].toString();
      //windSpeed = results['wind']['speed'].toString();
      weatherDescription = results['current']['condition']['text'];
      //weatherDescription = results['weather'][0]['description'].toString();
      // pressure = results['main']['pressure'].toString();
      // sunrise = dateTime.readTime(results['sys']['sunrise']);
      // sunset = dateTime.readTime(results['sys']['sunset']);

      maxtem1 = results['forecast']['forecastday'][1]['day']['maxtemp_c'].toString();
      mintemp1 = results['forecast']['forecastday'][1]['day']['mintemp_c'].toString();
      //date1 = dateTime.getDay(results['forecast']['forecastday'][1]['date'].toString());
      maxtem2 = results['forecast']['forecastday'][2]['day']['maxtemp_c'].toString();
      mintemp2 = results['forecast']['forecastday'][2]['day']['mintemp_c'].toString();
      //date2 = dateTime.getDay(results['forecast']['forecastday'][2]['date'].toString());
      maxtem3 = results['forecast']['forecastday'][3]['day']['maxtemp_c'].toString();
      mintemp3 = results['forecast']['forecastday'][3]['day']['mintemp_c'].toString();
     // date3 = dateTime.getDay(results['forecast']['forecastday'][3]['date'].toString());
      maxtem4 = results['forecast']['forecastday'][4]['day']['maxtemp_c'].toString();
      mintemp4 = results['forecast']['forecastday'][4]['day']['mintemp_c'].toString();
     // date4 = dateTime.getDay(results['forecast']['forecastday'][4]['date'].toString());
      maxtem5 = results['forecast']['forecastday'][5]['day']['maxtemp_c'].toString();
      mintemp5 = results['forecast']['forecastday'][5]['day']['mintemp_c'].toString();
     // date5 = dateTime.getDay(results['forecast']['forecastday'][5]['date'].toString());
      maxtem6 = results['forecast']['forecastday'][6]['day']['maxtemp_c'].toString();
      mintemp6 = results['forecast']['forecastday'][6]['day']['mintemp_c'].toString();
      //date6 = dateTime.getDay(results['forecast']['forecastday'][6]['date'].toString());
    });
    print("temp = "+temp);
    //print("found= "+found.toString());
    print("lat = "+lat);
    print("lon = "+lon);
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
                                windSpeed!=null?windSpeed+"km/h":"Load...",
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
                child: const ForecastList(),
                //width: MediaQuery.of(context).size.width,
                //color: Colors.orange,
              )
            ],
          ),
    ),
    );
  }
}

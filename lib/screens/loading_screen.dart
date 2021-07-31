import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
const spinkit = SpinKitWave(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  void getlocation() async {
    WeatherModel weatherModel = WeatherModel();
    dynamic data = await weatherModel.getdata();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherdata: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}

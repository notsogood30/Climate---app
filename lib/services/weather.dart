import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const api = '647d5c76a688f325ab566d9063ce3418';
class WeatherModel {
  double latitude, longitude;
  Future <dynamic>getweatherfromcity(String cityname) async {
    var url= 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$api&units=metric';
    Networkhelper networkhelper = await Networkhelper(url);
    var data = await networkhelper.getdata();
    return data;
  }
   Future <dynamic> getdata()async{
    Location location = Location();
    await location.getcurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    Networkhelper networkhelper = await Networkhelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api&units=metric');
    var data = await networkhelper.getdata();
    return data;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp,String city) {
    if (temp > 25) {
      return 'It\'s 🍦 time in $city';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in $city';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in $city';
    } else {
      return 'Bring a 🧥 just in case in $city';
    }
  }
}

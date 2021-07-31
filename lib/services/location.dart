import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
class Location{
  double longitude;
  double latitude;
  Future<void> getcurrentlocation() async
  {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude= position.latitude;
      longitude= position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }
}
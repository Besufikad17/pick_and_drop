import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pickanddrop/models/place.dart';
import 'dart:async';
import 'dart:convert';


Color getColorFromHex(String hex) {
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

Future<List<Place>> fetchPlaces() async {
  List<Place> places = [];
  final response = await http
      .get(Uri.parse('http://amircreations.com/walya/get_all_places.php'));

  if (response.statusCode == 200) {
    var res = jsonDecode(response.body)["response"];
    for (var element in res) {
      places.add(Place.fromJSON(element));
    }
  } else {
    throw Exception('Failed to load places');
  }

  return places;
}

List<String> getCity(List<Place> places) {
  List<String> cities = [];
  for(var place in places) {
    String p = "${place.title!}, ${place.street!}, ${place.zone!}, ${place.city!}";
    cities.add(p);
  }
  cities = cities.toSet().toList();
  return cities;
}

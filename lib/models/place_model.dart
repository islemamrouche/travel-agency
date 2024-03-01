import 'dart:ffi';

import 'package:flutter/material.dart';

class PlaceModel {
  String name;
  String description;
  String photo;
  double rating;
  int reviews;
  int price;

  PlaceModel({
    required this.name,
    required this.description,
    required this.photo,
    required this.rating,
    required this.reviews,
    required this.price
  });

  static List<PlaceModel> getPlaces() {
    List<PlaceModel> places = [];
    places.add(PlaceModel(name: 'Alley Palace', description: "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....", photo: "assets/images/alley.jpg", rating: 4.1, reviews: 355, price: 199));
    places.add(PlaceModel(name: 'Coeurdes', description: "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....", photo: "assets/images/coeurdes.jpg", rating: 4.1, reviews: 355, price: 199));
    places.add(PlaceModel(name: 'Alley Palace', description: "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....", photo: "assets/images/alley.jpg", rating: 4.1, reviews: 355, price: 199));
    places.add(PlaceModel(name: 'Alley Palace', description: "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....", photo: "assets/images/alley.jpg", rating: 4.1, reviews: 355, price: 199));
    return places;
  }
}


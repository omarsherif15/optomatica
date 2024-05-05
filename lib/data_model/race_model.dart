import 'dart:convert';

import 'package:flutter/services.dart';

class RaceModel {
  String? name;
  String? organizer;
  String? date;
  String? country;
  String? city;
  String? image;
  String? type;
  String? distances;

  RaceModel({
    required this.name,
    this.organizer,
    required this.date,
    required this.country,
    required this.city,
    required this.image,
    required this.type,
    required this.distances,
  });

  RaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    organizer = json['organizer'];
    date = json['date'];
    country = json['country'];
    city = json['city'];
    image = json['image'];
    type = json['type'];
    distances = json['distances'];
  }
}


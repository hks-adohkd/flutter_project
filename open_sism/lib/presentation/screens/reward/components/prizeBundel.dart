import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class PrizeBundle {
  final int id, points;
  final String title, description, imageSrc, value;
  final Color color;

  PrizeBundle(
      {this.id,
      this.value,
      this.points,
      this.title,
      this.description,
      this.imageSrc,
      this.color});
}

List<PrizeBundle> prizeBundles = [
  PrizeBundle(
    id: 1,
    value: "5\$",
    points: 10000,
    title: "Google Play",
    description: "google play gift card ",
    imageSrc: "assets/images/googlePlay.png",
    color: kGooglePlayCardColor, //Color(0xFFD82D40),
  ),
  PrizeBundle(
    id: 2,
    value: "100 units",
    points: 1000,
    title: "Syriatel Units",
    description: "100 Syriatel units will be delivered to your phone",
    imageSrc: "assets/images/mobileUnit.png",
    color: kSyriatelCardColor,
  ),
  PrizeBundle(
    id: 3,
    value: "100 units",
    points: 1000,
    title: "MTN Units",
    description: "100 MTN units will be delivered to your phone",
    imageSrc: "assets/images/mobileUnit.png",
    color: kMtnCardColor,
  ),
];

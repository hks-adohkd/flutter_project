import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';

class BuildFinishedTask {
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> finishedTaskLists = [
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
    {
      "name": "Youtube",
      "time": "10 / 11 / 2021 ",
      "points": "10000 Points",
      "image":
          "https://www.freepnglogos.com/uploads/the-end-png/the-end-flag-arrival-destination-end-finish-svg-png-icon-2.png"
    },
  ];

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFBBDEFB), //Colors.deepPurple,
      ),
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              //border: Border.all(width: 1, color: secondary),
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  finishedTaskLists[index]['name'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.stopwatch,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      finishedTaskLists[index]['time'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 13,
                        letterSpacing: .3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.star,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      finishedTaskLists[index]['points'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 13,
                        letterSpacing: .3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

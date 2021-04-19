import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/screens/task/components/taskBundel.dart';

class FinishedTask extends StatefulWidget {
  final TaskBundle product;
  FinishedTask({@required this.product});
  static String routeName = "/finishedTaskScreen";
  @override
  _FinishedTaskState createState() => _FinishedTaskState();
}

class _FinishedTaskState extends State<FinishedTask> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.13),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: kBoxDecoration,
                child: ListView.builder(
                    itemCount: finishedTaskLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              Container(
                height: 100,
                //decoration: kBoxDecoration,
                width: double.infinity,
                // decoration: BoxDecoration(
                //     color: primary,
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(30),
                //         bottomRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Finished Task",
                        style: kHeadingStyle,
                      ),
                    ),

                    //SizedBox(height: SizeConfig.screenHeight * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

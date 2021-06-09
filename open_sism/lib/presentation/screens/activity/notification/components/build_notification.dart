import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/theme.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';

class NotificationList {
  final String subject;
  final String message;
  final DateTime sendDate;

  NotificationList({this.subject, this.message, this.sendDate});
}

class BuildNotification {
  final List<NotificationList> notificationList;
  BuildNotification({this.notificationList});

  final List<Map> messageList = [
    {
      "title":
          "Strength does not  come from what you can do. \n Strength comes from overcoming the things you thought yyou couldn not",
      "id": "user",
    },
    {
      "title":
          "If you quit now, you will end up right back where you first began. \n And when you frist began, you were desperate to be where you are right now. Keep going.",
      "id": "admin",
    },
    {
      "title":
          "The Life you want comes when you decide to go get it. \n Just Remember Think positive, hope positive,definatly happen positive",
      "id": "user",
    },
    {
      "title":
          "Take the risk . if you win you will be happy. If you lose you will be wiser.",
      "id": "user",
    },
    {
      "title":
          "Take the risk . if you win you will be happy. If you lose you will be wiser.",
      "id": "admin",
    },
    {
      "title":
          "Take the risk Take the risk . if you win you will be happyTake the risk . if you win you will be happy. if you win you will be happy. If you lose you will be wiser.",
      "id": "admin",
    },
    {
      "title": "Take the risk ."
          "Take the risk . if you win you will be happy"
          "Take the risk . if you win you will be happy"
          "Take the risk . if you win you will be happy"
          "Take the risk . if you win you will be happy if you win you will be happy. If you lose you will be wiser.",
      "id": "user",
    },
  ];

  Widget buildList(BuildContext context, int index, String id, String sendDate,
      {List<NotificationList> notificationList}) {
    final ScrollController _controllerOne = ScrollController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white70,
      ),
      width: SizeConfig.screenHeight,
      height: 80,
      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(
          // left: id == "admin" ? 0 : 20,
          // right: id == "admin" ? 20 : 0,
          bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Scrollbar(
        controller: _controllerOne,
        isAlwaysShown: true,
        radius: Radius.circular(20),
        thickness: 4,
        child: SingleChildScrollView(
          controller: _controllerOne,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                notificationList[index].subject,
                style: TextStyle(
                    //color: primary,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                notificationList[index].message,
                style: TextStyle(
                    //color: primary,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  sendDate,
                  style: TextStyle(
                      //color: primary,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

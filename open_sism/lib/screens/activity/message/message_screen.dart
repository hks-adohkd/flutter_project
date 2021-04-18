import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/theme.dart';
import 'package:open_sism/configurations/size_config.dart';

class Messages extends StatefulWidget {
  static String routeName = "/messageScreen";
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      theme: theme(),
      home: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: kBoxDecoration,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03), // 4%
                  Text(
                    "Messages",
                    style: kHeadingStyle,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Container(
                    height: SizeConfig.screenHeight * 0.8,
                    child: ListView.builder(
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildList(
                              context, index, messageList[index]['id']);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index, String id) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white70,
      ),
      width: SizeConfig.screenHeight,
      height: 100,
      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(
          left: id == "admin" ? 0 : 20,
          right: id == "admin" ? 20 : 0,
          bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    messageList[index]['title'],
                    style: TextStyle(
                        //color: primary,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Container(
                    child: InkWell(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.share,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.replay,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.copy,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

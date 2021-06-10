import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/theme.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';

class ContactUsList {
  final String subject;
  final String message;
  final String replay;
  final String firstName;

  ContactUsList({this.subject, this.message, this.replay, this.firstName});
}

class BuildMessage {
  final List<ContactUsList> contactUsList;
  BuildMessage({this.contactUsList});
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

  Widget buildList(BuildContext context, int index, String id,
      {List<ContactUsList> contactUsList}) {
    final ScrollController _controllerOne = ScrollController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: contactUsList[index].replay != null
            ? Colors.white70
            : Colors.white38,
      ),
      width: SizeConfig.screenHeight,
      height: 140,
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
                '${contactUsList[index].firstName}: ${contactUsList[index].message}',
                style: TextStyle(
                    //color: primary,
                    color: Colors.black,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                contactUsList[index].replay != null
                    ? 'Admin : ${contactUsList[index].replay}'
                    : "Admin: no Answer yet ",
                style: contactUsList[index].replay != null
                    ? TextStyle(
                        //color: primary,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)
                    : TextStyle(
                        //color: primary,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildList(BuildContext context, int index, String id , List<ContactUsList> contactUsList) {
  //   final ScrollController _controllerOne = ScrollController();
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: id == "admin" ? Colors.white70 : Colors.white,
  //     ),
  //     width: SizeConfig.screenHeight,
  //     height: 140,
  //     //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //     margin: EdgeInsets.only(
  //         left: id == "admin" ? 0 : 20,
  //         right: id == "admin" ? 20 : 0,
  //         bottom: 10),
  //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Expanded(
  //           child: Scrollbar(
  //             controller: _controllerOne,
  //             isAlwaysShown: true,
  //             radius: Radius.circular(20),
  //             thickness: 4,
  //             child: SingleChildScrollView(
  //               controller: _controllerOne,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     messageList[index]['title'],
  //                     style: TextStyle(
  //                         //color: primary,
  //                         color: Colors.black,
  //                         fontSize: 14),
  //                   ),
  //                   Container(
  //                     child: InkWell(
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: <Widget>[
  //                           Padding(
  //                             padding: const EdgeInsets.all(15.0),
  //                             child: Icon(
  //                               Icons.share,
  //                               color: Colors.blue,
  //                               size: 18,
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.all(15.0),
  //                             child: Icon(
  //                               Icons.replay,
  //                               color: Colors.blue,
  //                               size: 18,
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.all(15.0),
  //                             child: Icon(
  //                               Icons.copy,
  //                               color: Colors.blue,
  //                               size: 18,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 20,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.all(15.0),
  //                             child: Row(
  //                               crossAxisAlignment: CrossAxisAlignment.end,
  //                               textBaseline: TextBaseline.alphabetic,
  //                               children: [
  //                                 Icon(
  //                                   id == "user"
  //                                       ? FontAwesomeIcons.userCircle
  //                                       : FontAwesomeIcons.userAlt,
  //                                   color: Colors.red,
  //                                   size: 18,
  //                                 ),
  //                                 SizedBox(
  //                                   width: 4,
  //                                 ),
  //                                 Text(
  //                                   id,
  //                                   style: TextStyle(color: Colors.red),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

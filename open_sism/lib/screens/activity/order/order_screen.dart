import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/theme.dart';
import 'package:open_sism/configurations/size_config.dart';

class Order extends StatefulWidget {
  static String routeName = "/orderScreen";
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> schoolLists = [
    {
      "name": "Google Play Gift card",
      "location": "5\$",
      "status": "Pending",
      "status": "Pending",
      "type": "10000 Points",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Xaviers International",
      "location": "234 Road Kathmandu, Nepal",
      "status": "Reject",
      "type": "Higher Secondary School",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Kinder Garden",
      "location": "572 Statan NY, 12483",
      "status": "Verified",
      "type": "Play Group School",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "WilingTon Cambridge",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "status": "Pending",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Fredik Panlon",
      "location": "572 Statan NY, 12483",
      "type": "Higher Secondary School",
      "status": "Reject",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Whitehouse International",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "status": "Verified",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Haward Play",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "status": "Pending",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
    },
    {
      "name": "Campare Handeson",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "status": "Verified",
      "logoText":
          "https://www.freepnglogos.com/uploads/gift-png/gift-png-past-events-dancegarden-grow-your-dance-offering-33.png"
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
                    itemCount: schoolLists.length,
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
                        "Orders",
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
        color: Colors.white,
      ),
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: secondary),
              image: DecorationImage(
                  image: NetworkImage(schoolLists[index]['logoText']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  schoolLists[index]['name'],
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
                      FontAwesomeIcons.dollarSign,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(schoolLists[index]['location'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
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
                      schoolLists[index]['type'],
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
                      schoolLists[index]['status'] == "Verified"
                          ? FontAwesomeIcons.checkCircle
                          : schoolLists[index]['status'] == "Pending"
                              ? FontAwesomeIcons.hourglass
                              : FontAwesomeIcons.timesCircle,
                      color: schoolLists[index]['status'] == "Verified"
                          ? verifiedColor
                          : schoolLists[index]['status'] == "Pending"
                              ? pendingColor
                              : rejectColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      schoolLists[index]['status'],
                      style: TextStyle(
                        color: schoolLists[index]['status'] == "Verified"
                            ? verifiedColor
                            : schoolLists[index]['status'] == "Pending"
                                ? pendingColor
                                : rejectColor,
                        fontSize: 13,
                        letterSpacing: .3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

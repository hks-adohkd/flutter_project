import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class OrderList {
  final String displayName;

  final String points;
  final String value;
  final String imgURL;
  final String prizeType;
  final String prizeStatusName;
  final String prizeStatusDisplayName;
  final DateTime requestDate;
  final String description;
  final DateTime earnDate;

  OrderList({
    this.points,
    this.description,
    this.displayName,
    this.value,
    this.earnDate,
    this.requestDate,
    this.imgURL,
    this.prizeStatusDisplayName,
    this.prizeStatusName,
    this.prizeType,
  });
}

class BuildOrder {
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> orderLists = [
    {
      "name": "Google Play Gift card",
      "location": "5\$",
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

  Widget buildList(BuildContext context, int index, List<OrderList> orderList,
      String earnDate, String requestDate) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFBBDEFB),
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
                  image: AssetImage("assets/images/giftOrder.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  orderList[index].displayName,
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
                    Text(orderList[index].value,
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
                      orderList[index].points + " points",
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
                      orderList[index].prizeStatusDisplayName == "Accepted"
                          ? FontAwesomeIcons.checkCircle
                          : orderList[index].prizeStatusDisplayName == "Pending"
                              ? FontAwesomeIcons.hourglass
                              : FontAwesomeIcons.timesCircle,
                      color: orderList[index].prizeStatusDisplayName ==
                              "Accepted"
                          ? verifiedColor
                          : orderList[index].prizeStatusDisplayName == "Pending"
                              ? pendingColor
                              : rejectColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      orderList[index].prizeStatusDisplayName == "Accepted"
                          ? orderList[index].prizeStatusDisplayName +
                              " " +
                              earnDate
                          : orderList[index].prizeStatusDisplayName == "Pending"
                              ? orderList[index].prizeStatusDisplayName +
                                  " " +
                                  requestDate
                              : orderList[index].prizeStatusDisplayName +
                                  " " +
                                  requestDate,
                      style: TextStyle(
                        color: orderList[index].prizeStatusDisplayName ==
                                "Accepted"
                            ? verifiedColor
                            : orderList[index].prizeStatusDisplayName ==
                                    "Pending"
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

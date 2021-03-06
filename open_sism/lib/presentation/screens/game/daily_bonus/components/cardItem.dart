import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem extends StatefulWidget {
  String imagePath;
  String title;
  String description;
  String price;
  Function press;
  bool visibility;

  CardItem(
      {this.imagePath,
      this.title,
      this.description,
      this.price,
      this.press,
      this.visibility = false});
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Opacity(
        opacity: widget.visibility ? 0.5 : 1,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(50.0),
              bottomLeft: Radius.circular(60.0),
            ),
            color: Colors.lightBlueAccent.withOpacity(0.5),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  widget.imagePath,
                  height: 70,
                  width: 70,
                ),
                Text(
                  widget.title,
                  style: GoogleFonts.adventPro(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Stack(children: [
                  Visibility(
                    visible: !widget.visibility,
                    child: Image.asset(
                      "assets/images/giftt.png",
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Visibility(
                    visible: widget.visibility,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 10),
                      child: Text(
                        widget.price,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),

                //AddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

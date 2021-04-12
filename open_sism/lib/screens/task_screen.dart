import 'package:flutter/material.dart';
import 'package:open_sism/components/categories.dart';
import 'package:open_sism/models/size_config.dart';
import 'package:open_sism/models/RecipeBundel.dart';
import 'package:open_sism/components/card_component.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Icon(
              Icons.home,
              color: Color(0xff002984),
              size: 30, // add custom icons also
            ),
          ),
        ),
        elevation: 5.0,
        backgroundColor: Color(0xff005cb2),
        centerTitle: true,
        shape: Cuvedshape(50),
        title: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text("Task",
                textAlign: TextAlign.end,
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 30,
                    color: Colors.white,
                    // fontFamily: Constants.FONT_ROBOTO,
                    fontWeight: FontWeight.bold))),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff002171),
                  Color(0xff8bf6ff),
                ],
              ),
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //Categories(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: GridView.builder(
                      itemCount: recipeBundles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            SizeConfig.orientation == Orientation.landscape
                                ? 2
                                : 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing:
                            SizeConfig.orientation == Orientation.landscape
                                ? SizeConfig.defaultSize * 2
                                : 0,
                        childAspectRatio: 1.65,
                      ),
                      itemBuilder: (context, index) => RecipeBundelCard(
                        recipeBundle: recipeBundles[index],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// double tempreature = decodeData['main']['temp'];
// int condition = decodeData['weather'][0]['id'];
// String cityName = decodeData['name'];
class Cuvedshape extends ContinuousRectangleBorder {
  const Cuvedshape(this.curveheights);
  final double curveheights;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(rect.size.width / 2,
        rect.size.height + curveheights * 2, rect.size.width, rect.size.height)
    ..lineTo(rect.size.width, 0)
    ..close();
}

import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/task/components/taskBundel.dart';

class TimeAndPerson extends StatelessWidget {
  const TimeAndPerson({
    Key key,
    @required this.product,
  }) : super(key: key);

  final TaskBundle product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      ColorDot(
                        color: Colors.lightGreen,
                        isSelected: true,
                      ),
                      Text("beginTime"),
                    ],
                  ),
                  Row(
                    children: [
                      ColorDot(
                        color: Colors.red,
                        isSelected: true,
                      ),
                      Text("endTime"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(
                  text: "Person\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: product.person.toString(),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF512DA8),
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

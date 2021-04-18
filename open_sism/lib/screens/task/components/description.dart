import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/task/components/taskBundel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_sism/screens/task/components/customButton.dart';

TaskTypes tasks;

class Description extends StatefulWidget {
  final TaskBundle product;
  Description({@required this.product});
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomButton(),
          Text(
            widget.product.description,
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}

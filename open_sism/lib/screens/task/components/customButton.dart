import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  String getTaskIcon(TaskType) {}

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16.0),
      onPressed: () async {
        if (await canLaunch(youtubeChannel)) launch(youtubeChannel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              const SizedBox(width: 10.0),
              Text(
                "Youtube",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
              "Subscribe our youtube channel YazTech to see us build some of these UIs as well as other flutter tutorials and resources."),
        ],
      ),
    );
  }
}

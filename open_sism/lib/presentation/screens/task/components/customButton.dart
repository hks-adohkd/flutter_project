import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';

class CustomButton extends StatefulWidget {
  final TaskBundle product;
  CustomButton({@required this.product});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16.0),
      onPressed: () async {
        if (await canLaunch(widget.product.link)) launch(widget.product.link);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                widget.product.icon,
                color: Colors.red,
              ),
              const SizedBox(width: 10.0),
              Text(
                widget.product.title,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(widget.product.description),
        ],
      ),
    );
  }
}

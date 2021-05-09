import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/task/components/customButton.dart';

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
          CustomButton(product: widget.product),
          Text(
            widget.product.description,
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'file:///E:/AndroidApp/opensism/open_sism/lib/screens/task/components/taskBundel.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final TaskBundle product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

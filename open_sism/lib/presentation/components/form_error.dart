import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({Key key, @required this.errors}) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(errors[index])),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          width: 14,
          height: 14,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          error,
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}

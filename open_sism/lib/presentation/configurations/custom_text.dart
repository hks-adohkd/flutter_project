import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

class CustomText extends StatelessWidget {
  final String text;
  final TextType type;
  final Color color;
  final TextAlign align;
  final bool forceBold;
  final int maxLines;
  final bool crossed;
  final TextDirection direction;

  const CustomText(
    this.text, {
    this.type = TextType.title,
    this.color,
    this.align = TextAlign.right,
    this.forceBold = false,
    this.maxLines = 2,
    this.crossed = false,
    this.direction = TextDirection.rtl,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      type == TextType.date ? getDate(text) : text,
      style: _getStyle(type, forceBold).copyWith(
        color: color,
        decoration: crossed ? TextDecoration.lineThrough : null,
      ),
      textDirection: this.direction,
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  String getDate(String text) {
    DateTime dateTime;
    var formatter = new intl.DateFormat('kk:mm - d/M/yyyy');
    dateTime = DateTime.parse(text).toLocal();
    String formatted = formatter.format(dateTime);

    return formatted;
  }

  TextStyle _getStyle(TextType type, bool bold) {
    TextStyle _title = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );

    TextStyle _extraTitle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );

    TextStyle _subtitle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );

    TextStyle _body = TextStyle(
      fontSize: 16,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w300,
    );

    TextStyle _titleWithShadow = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(0, 2),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.10),
        ),
      ],
    );

    TextStyle _smallBody = TextStyle(
      fontSize: 14,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w300,
    );

    TextStyle _link = TextStyle(
      fontSize: 12,
      decoration: TextDecoration.underline,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w300,
    );

    TextStyle _note = TextStyle(
      fontSize: 10,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w300,
    );

    TextStyle _number = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        height: 1);

    TextStyle _smallNumber =
        TextStyle(fontSize: 12, fontFamily: 'Roboto', height: 1);

    TextStyle _date = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1,
    );

    TextStyle _largeNumber = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1,
    );
    TextStyle _extraNumber = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1,
    );

    switch (type) {
      case TextType.title:
        return _title;
      case TextType.subtitle:
        return _subtitle;
      case TextType.body:
        return _body;
      case TextType.smallBody:
        return _smallBody;
      case TextType.number:
        return _number;
        break;
      case TextType.note:
        return _note;
        break;
      case TextType.titleWithShadow:
        return _titleWithShadow;
        break;
      case TextType.largeNumber:
        return _largeNumber;
        break;
      case TextType.date:
        return _date;
        break;
      case TextType.smallNumber:
        return _smallNumber;
        break;
      case TextType.extraNumber:
        return _extraNumber;
        break;
      case TextType.extraTitle:
        return _extraTitle;
        break;
      case TextType.link:
        return _link;
        break;
    }

    return _title;
  }
}

enum TextType {
  extraTitle,
  title,
  subtitle,
  body,
  smallBody,
  number,
  note,
  titleWithShadow,
  largeNumber,
  date,
  smallNumber,
  extraNumber,
  link
}

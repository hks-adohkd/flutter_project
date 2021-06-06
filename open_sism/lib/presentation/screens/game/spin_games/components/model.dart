import 'dart:ui';

class Luck {
  final String image;
  final Color color;
  final String point;
  final String prizeType;
  Luck(this.image, this.color, this.point, this.prizeType);

  String get asset => "assets/images/$image.png";
}

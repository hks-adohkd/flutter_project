import 'package:flutter/material.dart';
import 'package:open_sism/screens/game/spin/components/model.dart';

class BuildMethod {
  List<Luck> items = [
    Luck("apple", Color(0xFF9F6083), "10"),
    Luck("raspberry", Color(0xFFFDB78B), "30"),
    Luck("grapes", Color(0xFF57CFE2), "45"),
    Luck("fruit", Color(0xFF606B7E), "75"),
    Luck("milk", Color(0xFF24ACE9), "150"),
    Luck("salad", Color(0xFFFB7C7A), "250"),
    Luck("cheese", Color(0xFF1BD3AC), "500"),
    Luck("carrot", Color(0xFFa73737), "1000"),
  ];
  List<Luck> gift_items = [
    Luck("apple", Color(0xFF9F6083), "10"),
    Luck("raspberry", Color(0xFFFDB78B), "30"),
    Luck("grapes", Color(0xFF57CFE2), "45"),
    Luck("fruit", Color(0xFF606B7E), "75"),
    Luck("milk", Color(0xFF24ACE9), "150"),
  ];
}

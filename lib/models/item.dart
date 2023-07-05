import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  String _name = '';
  int _timesGotten = 0;

  Item(String name) : _name = name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get name {
    _timesGotten++;
    return _name;
  }

  int get howManyTimesGotten {
    return _timesGotten;
  }
}

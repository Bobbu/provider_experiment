import 'package:flutter/material.dart';
import 'item.dart';

class Box with ChangeNotifier {
  final List<Item> _stuff = [];

  void add(Item item) {
    _stuff.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _stuff.remove(item);
    notifyListeners();
  }

  void clear() {
    _stuff.clear();
    notifyListeners();
  }

  int get itemCount {
    return _stuff.length;
  }

  bool contains(Item item) {
    return _stuff.contains(item);
  }

  // provide an iterable but not modifiable form of the stuff
  Iterable<Item> get stuff => _stuff;
}

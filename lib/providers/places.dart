import 'dart:io';
import 'package:flutter/foundation.dart';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [...this._items];
  }

  void addPlace(
    String title,
    File pickedImage,
  ) {
    final Place newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: title,
      location: null,
    );
    this._items.add(newPlace);
    notifyListeners();
  }
}

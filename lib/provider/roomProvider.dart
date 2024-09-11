import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier {
  List selectedRooms = [];

  get getSelectedRoom => selectedRooms;

  set setSelectedRoom(String newRoom) {
    selectedRooms.add(newRoom);

    notifyListeners();
  }
}

class deviceProvider extends ChangeNotifier {
  List selectedRooms = [];

  get getSelectedRoom => selectedRooms;

  set setSelectedRoom(String deviceImage) {
    selectedRooms.add(deviceImage);

    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier {
  List<String> selectedRooms = [];

  get getSelectedRoom => selectedRooms;

  set setSelectedRoom(String newRoom) {
    selectedRooms.add(newRoom);
    notifyListeners();
  }
}



class deviceProvider with ChangeNotifier {
  List<Map<String, String>> selectedRooms = [];

  void addRoom(String roomName, String imagePath) {
    selectedRooms.add({
      'name': roomName,
      'imagePath': imagePath,
    });
    notifyListeners();
  }

  void removeRoom(int index) {
    selectedRooms.removeAt(index);
    notifyListeners();
  }
}





// class deviceProvider with ChangeNotifier {
//   String _selectedRoom = 'Living Room'; // Default value for the room

//   // Getter to access the current selected room
//   String get selectedRoom => _selectedRoom;

//   // Setter to update the selected room and notify listeners
//   set setSelectedRoom(String room) {
//     _selectedRoom = room;
//     notifyListeners(); // Notify listeners to update the UI
//   }
// }

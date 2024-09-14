import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier {
  List<String> selectedRooms = [];

  get getSelectedRoom => selectedRooms;

  set setSelectedRoom(String newRoom) {
    selectedRooms.add(newRoom);
    notifyListeners();
  }
}



// class deviceProvider with ChangeNotifier {
//   List<Map<String, String>> selectedRooms = [];

//   void addRoom(String roomName, String imagePath) {
//     selectedRooms.add({
//       'name': roomName,
//       'imagePath': imagePath,
//     });
//     notifyListeners();
//   }

//   void removeRoom(int index) {
//     selectedRooms.removeAt(index);
//     notifyListeners();
//   }
// }





class deviceProvider with ChangeNotifier {
  List<Map<String, String>> selectedRooms = [];

  // Method to add a room
  void addRoom(String roomName, String imagePath) {
    selectedRooms.add({
      'name': roomName,
      'imagePath': imagePath,
    });
    notifyListeners(); // Notify listeners that the list has changed
  }

  // Method to remove a room
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

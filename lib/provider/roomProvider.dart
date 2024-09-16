import 'package:flutter/material.dart';
import 'package:powerdown_frontend/models/roomModel.dart';
import 'package:uuid/uuid.dart'; // Add this package for unique IDs

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

//   // Method to add a room
//   void addRoom(String roomName, String imagePath) {
//     selectedRooms.add({
//       'name': roomName,
//       'imagePath': imagePath,
//     });
//     notifyListeners(); // Notify listeners that the list has changed
//   }

//   // Method to remove a room
//   void removeRoom(int index) {
//     selectedRooms.removeAt(index);
//     notifyListeners();
//   }
// }

// class deviceProvider with ChangeNotifier {
//   List<Map<String, dynamic>> selectedRooms = [];

//   // Method to add a room
//   void addRoom(String roomName, String imagePath) {
//     selectedRooms.add({
//       'name': roomName,
//       'imagePath': imagePath,
//       'devices': [], // Initialize an empty list of devices for the room
//     });
//     notifyListeners(); // Notify listeners that the list has changed
//   }

//   // Method to remove a room
//   void removeRoom(int index) {
//     selectedRooms.removeAt(index);
//     notifyListeners();
//   }

//   // Method to add a device to a room
//   void addDeviceToRoom(String roomName, String deviceName) {
//     final room = selectedRooms.firstWhere((room) => room['name'] == roomName);
//     if (!room['devices'].contains(deviceName)) {
//       room['devices'].add(deviceName);
//       notifyListeners(); // Trigger UI update
//     }
//   }

//   // Method to remove a device from a room
//   void removeDeviceFromRoom(String roomName, String deviceName) {
//     final room = selectedRooms.firstWhere((room) => room['name'] == roomName);
//     room['devices'].remove(deviceName);
//     notifyListeners(); // Trigger UI update
//   }
// }

class DeviceProvider with ChangeNotifier {
  final Uuid uuid = Uuid(); // For generating unique IDs
  List<Room> selectedRooms = [];

  Room? roomToAdd;
  void setRoomName(String roomName) {
    // roomToAdd["id"] = uuid.v4();
    // roomToAdd["name"] = roomName;
    // roomToAdd['devices'] = [];
    // roomToAdd['imagePath'] = _getRoomImagePath(roomName);
    roomToAdd = Room(
      id: uuid.v4(),
      name: roomName,
      imagePath: _getRoomImagePath(roomName),
      devices: [],
    );
  }

  // // Add unique ID to each room and ensure 'devices' is initialized as an empty list
  // void addRoom(String roomName, String imagePath) {
  //   selectedRooms.add({
  //     'id': uuid.v4(), // Generate a unique ID
  //     'name': roomName,
  //     'imagePath': imagePath,
  //     'devices': <String>[], // Initialize an empty list of devices
  //   });
  //   notifyListeners();
  // }
  String _getRoomImagePath(String roomName) {
    switch (roomName) {
      case 'Living Room':
        return 'assets/images/livingRoom.png';
      case 'Bedroom':
        return 'assets/images/bedroom.png';
      case 'Kitchen':
        return 'assets/images/kitchen.png';
      case 'Guest Room':
        return 'assets/images/guestRoom.png';
      case 'Bathroom':
        return 'assets/images/bathroom.png';
      default:
        return 'assets/images/defaultRoom.png';
    }
  }

  String addRoom(String roomName, String imagePath) {
    final roomId = uuid.v4(); // Generate a unique ID
    selectedRooms.add(Room(id: roomId, name: roomName, imagePath: imagePath, devices: []));
    notifyListeners();
    return roomId;
  }

  void removeRoom(String roomId) {
    selectedRooms.removeWhere((room) => room.id == roomId);
    // selectedRooms = List<Map<String, dynamic>>.from(
        // selectedRooms); // Ensure list is replaced
        
    notifyListeners();
  }

  // Updated methods with list replacement
  void addDeviceToRoom(String roomId, String deviceName) {
    // final roomIndex = selectedRooms.indexWhere((room) => room['id'] == roomId);
    // print(roomIndex);
    // if (roomIndex != -1) {
    //   Map<String, dynamic> room = Map<String, dynamic>.from(selectedRooms[roomIndex]);
    //   List<String> devices = List<String>.from(room['devices'] as List<String>? ?? <String>[]);

    // print(devices);
    if (!roomToAdd!.devices.contains(deviceName)) {
      roomToAdd!.devices.add(deviceName);
      // room['devices'] = devices;
      // selectedRooms[roomIndex] = room;
      // selectedRooms = List<Map<String, dynamic>>.from(selectedRooms); // Replace entire list
      // print(room);
    }
  }

  void pushRoom() {
    selectedRooms.add(roomToAdd!);
    notifyListeners();
  }

  // void removeDeviceFromRoom(String roomId, String deviceName) {
  //   final roomIndex = selectedRooms.indexWhere((room) => room.id == roomId);
  //   if (roomIndex != -1) {
  //     List<Map<String, dynamic>> roomsClone =
  //         List<Map<String, dynamic>>.from(selectedRooms);
  //     Map<String, dynamic> room =
  //         Map<String, dynamic>.from(roomsClone[roomIndex]);
  //     List<String> devices =
  //         List<String>.from(room['devices'] as List<String>? ?? <String>[]);

  //     if (devices.contains(deviceName)) {
  //       devices.remove(deviceName);
  //       room['devices'] = devices;
  //       roomsClone[roomIndex] = room;
  //       selectedRooms = roomsClone;
  //       notifyListeners();
  //     }
  //   }
  // }

  List<String> getDevicesForRoom(String roomId) {
    final roomIndex = selectedRooms.indexWhere((room) => room.id == roomId);
    if (roomIndex != -1) {
      final room = selectedRooms[roomIndex];
      return List<String>.from(room.devices ?? <String>[]);
    }
    return <String>[];
  }
}

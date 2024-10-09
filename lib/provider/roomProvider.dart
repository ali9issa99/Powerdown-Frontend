import 'package:flutter/material.dart';
import 'package:powerdown_frontend/models/roomModel.dart';
import 'package:uuid/uuid.dart'; // Add this package for unique IDs


import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  User _user;

  UserProvider(this._user);

  User get user => _user;

  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  // Fetch user data from backend
  Future<void> fetchUserData(String userId) async {
    try {
      final response = await http.get(Uri.parse('https://10.0.2.2:8080/api/users/$userId'));
      if (response.statusCode == 200) {
        _user = User.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      print('Error fetching user: $error');
    }
  }

  // Update user data in backend
  Future<void> updateUser(User updatedUser) async {
    try {
      final response = await http.put(
        Uri.parse('https://10.0.2.2:8080/api/users/${updatedUser.userId}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedUser.toJson()),
      );
      if (response.statusCode == 200) {
        _user = User.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to update user');
      }
    } catch (error) {
      print('Error updating user: $error');
    }
  }

  // Add new room
  Future<void> addRoom(Room room) async {
    try {
      final response = await http.post(
        Uri.parse('https://10.0.2.2:8080/api/users/${_user.userId}/rooms'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'action': 'addRoom', 'data': {'roomName': room.name}}),
      );
      if (response.statusCode == 200) {
        _user.rooms.add(Room.fromJson(json.decode(response.body)));
        notifyListeners();
      }
    } catch (error) {
      print('Error adding room: $error');
    }
  }
}


class RoomProvider with ChangeNotifier {
  final Uuid uuid = Uuid();
  List<Room> selectedRooms = [];

  Room? roomToAdd;
  void setRoomName(String roomName) {
    roomToAdd = Room(
      id: uuid.v4(),
      name: roomName,
      imagePath: _getRoomImagePath(roomName),
      devices: [],
    );
  }

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
    final roomId = uuid.v4();
    selectedRooms.add(
        Room(id: roomId, name: roomName, imagePath: imagePath, devices: []));
    notifyListeners();
    return roomId;
  }

  void removeRoom(String roomId) {
    selectedRooms.removeWhere((room) => room.id == roomId);

    notifyListeners();
  }

  // Updated methods with list replacement
  void addDeviceToRoom(String roomId, String deviceName) {
    if (!roomToAdd!.devices.contains(deviceName)) {
      roomToAdd!.devices.add(deviceName);
    }
  }

  void pushRoom() {
    selectedRooms.add(roomToAdd!);
    notifyListeners();
  }

  List<String> getDevicesForRoom(String roomId) {
    final roomIndex = selectedRooms.indexWhere((room) => room.id == roomId);
    if (roomIndex != -1) {
      final room = selectedRooms[roomIndex];
      return List<String>.from(room.devices ?? <String>[]);
    }
    return <String>[];
  }




 // Backend Integration Methods

  // Fetch rooms from backend
  Future<void> fetchRooms(String userId) async {
    try {
      final response = await http.get(Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms'));
      if (response.statusCode == 200) {
        final List<dynamic> roomsData = json.decode(response.body);
        selectedRooms = roomsData.map((room) => Room.fromJson(room)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load rooms');
      }
    } catch (error) {
      print('Error fetching rooms: $error');
    }
  }

  // Add room to backend
// Add room to backend
Future<void> addRoomToBackend(String roomName, String userId) async {
  final roomId = uuid.v4();
  final newRoom = Room(
    id: roomId,
    name: roomName,
    imagePath: _getRoomImagePath(roomName),
    devices: [],
  );

  try {
    final response = await http.post(
      Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'action': 'addRoom', 'data': {'roomName': roomName}}),
    );
    if (response.statusCode == 200) {
      // Update frontend state with new room
      selectedRooms.add(newRoom);
      notifyListeners();
    } else {
      throw Exception('Failed to add room');
    }
  } catch (error) {
    print('Error adding room: $error');
  }
}


  // Remove room from backend
  Future<void> removeRoomFromBackend(String roomId, String userId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms/$roomId'),
      );
      if (response.statusCode == 200) {
        removeRoom(roomId);
      } else {
        throw Exception('Failed to remove room');
      }
    } catch (error) {
      print('Error removing room: $error');
    }
  }

// Add device to a room in the backend
Future<void> addDeviceToBackendRoom(String roomId, String deviceName, String userId) async {
  try {
    final response = await http.post(
      Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms/$roomId/devices'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'action': 'addDevice', 'data': {'roomName': roomId, 'deviceName': deviceName}}),
    );
    if (response.statusCode == 200) {
      // Update frontend state after successful addition to backend
      addDeviceToRoom(roomId, deviceName);
      notifyListeners();
    } else {
      throw Exception('Failed to add device');
    }
  } catch (error) {
    print('Error adding device: $error');
  }
}










// class DeviceProvider with ChangeNotifier {
//   List<Device> devices = [];

//   void addDevice(String deviceId, String deviceName, String status) {
//     devices.add(Device(
//       deviceId: deviceId,
//       deviceName: deviceName,
//       status: status,
//       consumption: [], // Initialize an empty list for consumption details
//     ));
//     notifyListeners(); // Notify the listeners to update UI
//   }

//   void removeDevice(String deviceId) {
//     devices.removeWhere((device) => device.deviceId == deviceId);
//     notifyListeners(); // Notify the listeners to update UI
//   }

//   void toggleDeviceStatus(String deviceId) {
//     final deviceIndex = devices.indexWhere((device) => device.deviceId == deviceId);
//     if (deviceIndex != -1) {
//       devices[deviceIndex].status = (devices[deviceIndex].status == 'on') ? 'off' : 'on';
//       notifyListeners(); // Notify the listeners to update UI
//     }
//   }

//   void addConsumption(String deviceId, String consumptionDetail) {
//     final deviceIndex = devices.indexWhere((device) => device.deviceId == deviceId);
//     if (deviceIndex != -1) {
//       devices[deviceIndex].consumption.add(consumptionDetail);
//       notifyListeners(); // Notify the listeners to update UI
//     }
//   }

//   List<String> getDeviceConsumption(String deviceId) {
//     final device = devices.firstWhere((device) => device.deviceId == deviceId, orElse: () => Device(deviceId: '', deviceName: '', status: '', consumption: []));
//     return device.consumption;
//   }
// }

//###############################################################################################

// class DeviceProvider with ChangeNotifier {
//   List<Device> devices = [];

//   // Fetch devices from the backend
//   Future<void> fetchDevices(String roomId, String userId) async {
//     try {
//       final response = await http.get(Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms/$roomId/devices'));
//       if (response.statusCode == 200) {
//         final List<dynamic> deviceData = json.decode(response.body);
//         devices = deviceData.map((device) => Device.fromJson(device)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load devices');
//       }
//     } catch (error) {
//       print('Error fetching devices: $error');
//     }
//   }

//   // Add a device to the backend
//   Future<void> addDevice(String roomId, Device device, String userId) async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms/$roomId/devices'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'action': 'addDevice',
//           'data': {'deviceName': device.deviceName},
//         }),
//       );
//       if (response.statusCode == 200) {
//         devices.add(device);
//         notifyListeners();
//       } else {
//         throw Exception('Failed to add device');
//       }
//     } catch (error) {
//       print('Error adding device: $error');
//     }
//   }

//   // Update device status
//   Future<void> updateDeviceStatus(String roomId, String deviceId, String newStatus, String userId) async {
//     try {
//       final response = await http.put(
//         Uri.parse('https://10.0.2.2:8080/api/users/$userId/rooms/$roomId/devices/$deviceId'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'status': newStatus}),
//       );
//       if (response.statusCode == 200) {
//         final deviceIndex = devices.indexWhere((device) => device.deviceId == deviceId);
//         if (deviceIndex != -1) {
//           devices[deviceIndex].status = newStatus;
//           notifyListeners();
//         }
//       } else {
//         throw Exception('Failed to update device status');
//       }
//     } catch (error) {
//       print('Error updating device status: $error');
//     }
//   }
// }
}
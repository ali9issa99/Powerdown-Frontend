import 'package:flutter/material.dart';
import 'package:powerdown_frontend/models/roomModel.dart';
import 'package:uuid/uuid.dart'; // Add this package for unique IDs
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserProvider extends ChangeNotifier {
  User _user;

  UserProvider(this._user);

  User get user => _user;
   String get userId => _user.userId; // Add this getter

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
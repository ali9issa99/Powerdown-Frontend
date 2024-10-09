// class Room{
//   final String id;
//   String name;
//   String imagePath;
//   List<String> devices;

//   Room({
//     required this.id,
//     required this.name,
//     required this.imagePath,
//     required this.devices,
//   });
// }




// //class Device
// class Device {
//   final String deviceId;
//   final String deviceName;
//   String status;
//   List<Consumption> consumption; // Updated to List<Consumption>

//   Device({
//     required this.deviceId,
//     required this.deviceName,
//     required this.status,
//     required this.consumption,
//   });
// }




// class Consumption {
//   final DateTime timeOn;
//   final double energyUsage;

//   Consumption({
//     required this.timeOn,
//     required this.energyUsage,
//   });
// }



class User {
  final String userId;
  // String name;
  // String email;
  List<Room> rooms;

  User({
    required this.userId,
    // required this.name,
    // required this.email,
    required this.rooms,
  });

  // Convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      // 'name': name,
      // 'email': email,
      'rooms': rooms.map((room) => room.toJson()).toList(),
    };
  }

  // Create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      // name: json['name'],
      // email: json['email'],
      rooms: List<Room>.from(json['rooms'].map((data) => Room.fromJson(data))),
    );
  }
}




class Room {
  final String id;
  String name;
  String imagePath;
  List<String> devices;

  Room({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.devices,
  });

  // Convert Room instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'devices': devices,
    };
  }

  // Create a Room instance from JSON
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      devices: List<String>.from(json['devices']),
    );
  }
}




class Device {
  final String deviceId;
  final String deviceName;
  String status;
  List<Consumption> consumption;

  Device({
    required this.deviceId,
    required this.deviceName,
    required this.status,
    required this.consumption,
  });

  // Convert Device instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'status': status,
      'consumption': consumption.map((c) => c.toJson()).toList(),
    };
  }

  // Create a Device instance from JSON
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      status: json['status'],
      consumption: List<Consumption>.from(
          json['consumption'].map((data) => Consumption.fromJson(data))),
    );
  }
}



class Consumption {
  final DateTime timeOn;
  final double energyUsage;

  Consumption({
    required this.timeOn,
    required this.energyUsage,
  });

  // Convert Consumption instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'timeOn': timeOn.toIso8601String(),
      'energyUsage': energyUsage,
    };
  }

  // Create a Consumption instance from JSON
  factory Consumption.fromJson(Map<String, dynamic> json) {
    return Consumption(
      timeOn: DateTime.parse(json['timeOn']),
      energyUsage: json['energyUsage'],
    );
  }
}

class Room{
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
}




//class Device
class Device {
  final String deviceId;
  final String deviceName;
  String status;
  List<Consumption> consumption; // Updated to List<Consumption>

  Device({
    required this.deviceId,
    required this.deviceName,
    required this.status,
    required this.consumption,
  });
}




class Consumption {
  final DateTime timeOn;
  final double energyUsage;

  Consumption({
    required this.timeOn,
    required this.energyUsage,
  });
}


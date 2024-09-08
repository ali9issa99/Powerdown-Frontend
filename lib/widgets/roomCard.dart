import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final List<String> devices;
  final String image;
  final VoidCallback onDelete;

  const RoomCard({
    Key? key,
    required this.roomName,
    required this.devices,
    required this.image,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          Image.asset(image), // Display room image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  roomName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: onDelete, // Call the delete function
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: devices.map((device) {
              return Icon(_getDeviceIcon(device)); // Display device icons
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  IconData _getDeviceIcon(String device) {
    switch (device) {
      case 'light':
        return Icons.lightbulb_outline;
      case 'fan':
        return Icons.ac_unit; // Example icon
      case 'thermostat':
        return Icons.thermostat_outlined;
      default:
        return Icons.devices_other;
    }
  }
}

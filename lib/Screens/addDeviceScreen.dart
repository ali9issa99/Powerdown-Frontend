import 'package:flutter/material.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add devices'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Display two devices per row
          childAspectRatio: 2.5, // Adjust aspect ratio as per the design
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            _buildDeviceTile('Smart TV', Icons.tv),
            _buildDeviceTile('AC', Icons.ac_unit),
            _buildDeviceTile('Heater', Icons.heat_pump),
            _buildDeviceTile('Light 1', Icons.light),
            _buildDeviceTile('Fan', Icons.toys), // Placeholder for a fan
            _buildDeviceTile('Light 2', Icons.lightbulb),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTile(String deviceName, IconData iconData) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(iconData, size: 30), // Icon for the device
            Text(deviceName, style: const TextStyle(fontSize: 16)),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    // Logic to add device
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    // Logic to remove device
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

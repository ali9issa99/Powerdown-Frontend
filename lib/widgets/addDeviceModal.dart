import 'package:flutter/material.dart';

class AddDeviceModal extends StatelessWidget {
  const AddDeviceModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Add devices',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2.5, // Adjust this to make the buttons fit properly
            children: const [
              DeviceTile(deviceName: 'Smart Tv'),
              DeviceTile(deviceName: 'AC'),
              DeviceTile(deviceName: 'Heater'),
              DeviceTile(deviceName: 'Light 1'),
              DeviceTile(deviceName: 'Fan'),
              DeviceTile(deviceName: 'Light 2'),
            ],
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Handle the 'Continue' button press here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004B43),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the modal
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text(
              'Back',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;

  const DeviceTile({Key? key, required this.deviceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(deviceName, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Handle remove action
                },
                icon: const Icon(Icons.remove, color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  // Handle add action
                },
                icon: const Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

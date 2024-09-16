// roomDetails.dart

import 'package:flutter/material.dart';

class RoomDetails extends StatefulWidget {
  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  // Example device statuses
  Map<String, bool> deviceStatus = {
    'Smart TV': true,
    'AC': false,
    'Heater': false,
    'Light 1': true,
    'Fan': false,
    'Light 2': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Living Room'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add new device or functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Room Image
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                'https://example.com/room_image.jpg', // Replace with room image URL
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            // Devices Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Devices',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Device list grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: deviceStatus.length,
                    itemBuilder: (context, index) {
                      String deviceName = deviceStatus.keys.elementAt(index);
                      bool isOn = deviceStatus[deviceName]!;

                      return DeviceTile(
                        deviceName: deviceName,
                        isOn: isOn,
                        onToggle: (value) {
                          setState(() {
                            deviceStatus[deviceName] = value;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const DeviceTile({
    required this.deviceName,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(deviceName, style: TextStyle(fontSize: 16)),
              Text(isOn ? 'On' : 'Off', style: TextStyle(fontSize: 14)),
            ],
          ),
          Switch(
            value: isOn,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}

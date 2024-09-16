import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';

class RoomDetails extends StatefulWidget {
  final String roomName; // Pass the room name dynamically
  final String imagePath; // Pass the image path dynamically

  const RoomDetails({required this.roomName, required this.imagePath});

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  // Example device statuses (you can fetch them dynamically)
  Map<String, bool> deviceStatus = {
    'Smart TV': true,
    'AC': false,
    'Heater': false,
    'Light 1': true,
    'Fan': false,
    'Light 2': true,
  };

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use Navigator.pushReplacementNamed to replace the current screen
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/addRoom');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/analytics');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/achievements');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.roomName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ), // Dynamic title based on the room name
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios, // iPhone-like back arrow
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Flat design for the app bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Room Image with Border Radius
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Devices Section
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
                  IconData deviceIcon = _getDeviceIcon(deviceName);

                  return DeviceTile(
                    deviceName: deviceName,
                    deviceIcon: deviceIcon,
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
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  IconData _getDeviceIcon(String deviceName) {
    switch (deviceName) {
      case 'Smart TV':
        return Icons.tv;
      case 'AC':
        return Icons.ac_unit;
      case 'Heater':
        return Icons.fireplace;
      case 'Light 1':
      case 'Light 2':
        return Icons.lightbulb;
      case 'Fan':
        return Icons.mode_fan_off_outlined;
      default:
        return Icons.device_unknown;
    }
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final IconData deviceIcon;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const DeviceTile({
    required this.deviceName,
    required this.deviceIcon,
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(deviceIcon, size: 40, color: Colors.grey), // Device Icon
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(deviceName, style: TextStyle(fontSize: 16)),
                Text(isOn ? 'On' : 'Off', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Switch(
              value: isOn,
              onChanged: onToggle,
              activeColor: Colors.green, // Green color when the switch is ON
            ),
          ),
        ],
      ),
    );
  }
}

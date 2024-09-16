import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/addRoomModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:provider/provider.dart';

// class AddDeviceModal extends StatelessWidget {
//   final String selectedRoom;
//   final Function(String roomName)? onRoomAdded;

//   const AddDeviceModal({
//     Key? key,
//     required this.selectedRoom,
//     this.onRoomAdded, // Update constructor
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 0.67, // Increased to make it extend more upwards
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 10),
//               const Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Add devices',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 1.7,
//                 children: const [
//                   DeviceTile(deviceName: 'Smart Tv', deviceIcon: Icons.tv),
//                   DeviceTile(deviceName: 'AC', deviceIcon: Icons.ac_unit),
//                   DeviceTile(deviceName: 'Heater', deviceIcon: Icons.fireplace),
//                   DeviceTile(
//                       deviceName: 'Light 1', deviceIcon: Icons.lightbulb),
//                   DeviceTile(deviceName: 'Fan', deviceIcon: Icons.toys),
//                   DeviceTile(
//                       deviceName: 'Light 2', deviceIcon: Icons.lightbulb),
//                 ],
//               ),
//               const SizedBox(height: 40),
//                ElevatedButton(
//                 onPressed: () {
//                   // Navigate to ConfirmationModal without closing AddDeviceModal
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ConfirmationModal(
//                         selectedRoom: selectedRoom,
//                         onRoomAdded: (roomName) {
//                           // Add the room logic here when Done is pressed in ConfirmationModal
//                           Navigator.pop(context); // Close ConfirmationModal
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF004B43),
//                   minimumSize: const Size.fromHeight(48),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Continue',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);

//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     builder: (BuildContext context) {
//                       return AddRoomModal(
//                         onRoomSelected: (roomName) {
//                           // Handle room selection logic here
//                           print('Selected room: $roomName');
//                         },
//                       );
//                     },
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   minimumSize: const Size.fromHeight(48),
//                 ),
//                 child: const Text(
//                   'Back',
//                   style: TextStyle(
//                       fontSize: 18, color: Color.fromARGB(255, 0, 75, 67)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DeviceTile extends StatelessWidget {
//   final String deviceName;
//   final IconData deviceIcon;

//   const DeviceTile(
//       {Key? key, required this.deviceName, required this.deviceIcon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F5F5),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.5),
//       child: Row(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceBetween, // Align content horizontally
//         children: [
//           // Icon and Device Name on the Left
//           Row(
//             children: [
//               Icon(deviceIcon, size: 28), // Icon of the device
//               const SizedBox(width: 8), // Space between icon and text
//               Text(deviceName,
//                   style: const TextStyle(fontSize: 16)), // Device name
//             ],
//           ),
//           // Add and Remove buttons on the Right
//           Column(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Handle add action
//                 },
//                 icon: const Icon(Icons.add, color: Colors.black),
//               ),
//               IconButton(
//                 onPressed: () {
//                   // Handle remove action
//                 },
//                 icon: const Icon(Icons.remove, color: Colors.black),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class AddDeviceModal extends StatelessWidget {
  final String selectedRoomId; // Room ID (UUID) passed here
  final Function(String roomName)? onRoomAdded;

  const AddDeviceModal({
    Key? key,
    required this.selectedRoomId, // Room ID as parameter
    this.onRoomAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.67, // Increased to make it extend more upwards
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                childAspectRatio: 1.7,
                children: [
                  DeviceTile(
                    deviceName: 'Smart Tv',
                    deviceIcon: Icons.tv,
                    selectedRoomId: selectedRoomId, // Pass room UUID
                  ),
                  DeviceTile(
                    deviceName: 'AC',
                    deviceIcon: Icons.ac_unit,
                    selectedRoomId: selectedRoomId,
                  ),
                  DeviceTile(
                    deviceName: 'Heater',
                    deviceIcon: Icons.fireplace,
                    selectedRoomId: selectedRoomId,
                  ),
                  DeviceTile(
                    deviceName: 'Light 1',
                    deviceIcon: Icons.lightbulb,
                    selectedRoomId: selectedRoomId,
                  ),
                  DeviceTile(
                    deviceName: 'Fan',
                    deviceIcon: Icons.mode_fan_off_outlined,
                    selectedRoomId: selectedRoomId,
                  ),
                  DeviceTile(
                    deviceName: 'Light 2',
                    deviceIcon: Icons.lightbulb,
                    selectedRoomId: selectedRoomId,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              // Open the Add Device modal
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return ConfirmationModal(
                    selectedRoom: selectedRoomId, // Pass selected room
                    onRoomAdded: (roomName) {
                      
                    },
                  );
                },
              );
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
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 0, 75, 67)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class DeviceTile extends StatelessWidget {
  final String deviceName;
  final IconData deviceIcon;
  final String selectedRoomId; // Now correctly using roomId (UUID)

  const DeviceTile({
    Key? key,
    required this.deviceName,
    required this.deviceIcon,
    required this.selectedRoomId, // Pass roomId (UUID)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('DeviceTile: selectedRoomId = $selectedRoomId, deviceName = $deviceName');
    
    // Fetch devices for this room using roomId (UUID)
    final devices = Provider.of<DeviceProvider>(context).getDevicesForRoom(selectedRoomId);
    final isDeviceAdded = devices.contains(deviceName); // Check if the device is added

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon and Device Name on the Left
          Row(
            children: [
              Icon(deviceIcon, size: 28), // Icon of the device
              const SizedBox(width: 8), // Space between icon and text
              Text(deviceName, style: const TextStyle(fontSize: 16)),
            ],
          ),
          // Add and Remove buttons on the Right
          Column(
            children: [
              IconButton(
                onPressed: isDeviceAdded
                    ? null // Disable the button if the device is already added
                    : () {
                        // Add the device to the room using roomId (UUID)
                        Provider.of<DeviceProvider>(context, listen: false)
                            .addDeviceToRoom(selectedRoomId, deviceName, );
                      },
                icon: Icon(Icons.add,
                    color: isDeviceAdded ? Colors.grey : Colors.black),
              ),
              IconButton(
                onPressed: !isDeviceAdded
                    ? null // Disable the button if the device is not in the room
                    : () {
                        // Remove the device from the room using roomId (UUID)
                        Provider.of<DeviceProvider>(context, listen: false)
                            .removeDeviceFromRoom(selectedRoomId, deviceName);
                      },
                icon: Icon(Icons.remove,
                    color: !isDeviceAdded ? Colors.grey : Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:powerdown_frontend/widgets/addRoomModal.dart';
// import 'package:powerdown_frontend/widgets/confirmationModal.dart';

// class AddDeviceModal extends StatelessWidget {
//   final String selectedRoom;
//   final Function(String deviceName)? onDeviceAdded; // Update constructor

//   const AddDeviceModal({
//     Key? key,
//     required this.selectedRoom,
//     this.onDeviceAdded, // Update constructor
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 1.7, // Increased to make it extend more upwards
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
//               ElevatedButton(
//                 onPressed: () {
//                   // Close AddDeviceModal
//                   Navigator.pop(context);

//                   // Open ConfirmationModal after a short delay
//                   Future.delayed(Duration(milliseconds: 200), () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return ConfirmationModal(
//                           selectedRoom: selectedRoom,
//                           onRoomAdded: (roomName) {
//                             if (onDeviceAdded != null) {
//                               onDeviceAdded!(roomName); // Use the correct callback here
//                             }
//                           },
//                         );
//                       },
//                     );
//                   });
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







// import 'package:flutter/material.dart';

// class AddDeviceModal extends StatelessWidget {
//   final String selectedRoom;
//   final void Function(String) onDeviceAdded; // Correct named parameter

//   const AddDeviceModal({
//     Key? key,
//     required this.selectedRoom,
//     required this.onDeviceAdded, // Ensure this matches your AddDeviceModal constructor
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//         ),
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 25),
//           Text(
//             'Add Device to $selectedRoom',
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 40),
//           // Add your device addition UI here
//           ElevatedButton(
//             onPressed: () {
//               onDeviceAdded(selectedRoom); // Pass the room name
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF004B43),
//               minimumSize: const Size.fromHeight(48),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//             ),
//             child: const Text(
//               'Continue',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';



// class AddDeviceModal extends StatelessWidget {
//   final String selectedRoom;
//   final void Function(String) onDeviceAdded;

//   const AddDeviceModal({
//     Key? key,
//     required this.selectedRoom,
//     required this.onDeviceAdded,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//         ),
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 25),
//           Text(
//             'Add Device to $selectedRoom',
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 40),
//           // Add your device addition UI here
//           ElevatedButton(
//             onPressed: () {
//               onDeviceAdded(selectedRoom); // Pass the room name
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF004B43),
//               minimumSize: const Size.fromHeight(48),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//             ),
//             child: const Text(
//               'Continue',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/addRoomModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart';

class AddDeviceModal extends StatelessWidget {
  final String selectedRoom;
  final Function(String roomName)? onRoomAdded;

  const AddDeviceModal({
    Key? key,
    required this.selectedRoom,
    this.onRoomAdded, // Update constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.7, // Increased to make it extend more upwards
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
                children: const [
                  DeviceTile(deviceName: 'Smart Tv', deviceIcon: Icons.tv),
                  DeviceTile(deviceName: 'AC', deviceIcon: Icons.ac_unit),
                  DeviceTile(deviceName: 'Heater', deviceIcon: Icons.fireplace),
                  DeviceTile(
                      deviceName: 'Light 1', deviceIcon: Icons.lightbulb),
                  DeviceTile(deviceName: 'Fan', deviceIcon: Icons.toys),
                  DeviceTile(
                      deviceName: 'Light 2', deviceIcon: Icons.lightbulb),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Close AddDeviceModal
                  Navigator.pop(context);

                  // Open ConfirmationModal after a short delay
                  Future.delayed(Duration(milliseconds: 200), () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return ConfirmationModal(
                          selectedRoom:
                              selectedRoom, // Pass the selected room to ConfirmationModal
                          onRoomAdded: (roomName) {
                            // Handle any action when room is confirmed
                          },
                        );
                      },
                    );
                  });
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

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return AddRoomModal(
                        onRoomSelected: (roomName) {
                          // Handle room selection logic here
                          print('Selected room: $roomName');
                        },
                      );
                    },
                  );
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

  const DeviceTile(
      {Key? key, required this.deviceName, required this.deviceIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.5),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align content horizontally
        children: [
          // Icon and Device Name on the Left
          Row(
            children: [
              Icon(deviceIcon, size: 28), // Icon of the device
              const SizedBox(width: 8), // Space between icon and text
              Text(deviceName,
                  style: const TextStyle(fontSize: 16)), // Device name
            ],
          ),
          // Add and Remove buttons on the Right
          Column(
            children: [
              IconButton(
                onPressed: () {
                  // Handle add action
                },
                icon: const Icon(Icons.add, color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  // Handle remove action
                },
                icon: const Icon(Icons.remove, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:provider/provider.dart';
import 'package:powerdown_frontend/Screens/roomDetails.dart'; // Import roomDetails.dart to navigate to it

// class RoomCard extends StatelessWidget {
//   final String roomName;
//   final String imagePath;
//   final VoidCallback onDelete;
//   final VoidCallback onTap; // Added for card tap navigation

//   const RoomCard({
//     Key? key,
//     required this.roomName,
//     required this.imagePath,
//     required this.onDelete,
//     required this.onTap, // For navigation
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Navigate to the screen when the card is pressed
//       child: Card(
//         elevation: 5,
//         margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Room image at the top
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ),
//               child: Image.asset(
//                 imagePath,
//                 width: double.infinity,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Text(
//                 roomName,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Device icons on the bottom left
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.tv), // Smart TV
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.ac_unit), // AC
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.fireplace), // Heater
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.lightbulb), // Light 1
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: SvgPicture.asset(
//                           'assets/icons/fan1.svg', // Fan SVG
//                           height: 24, // Adjust height if needed
//                           width: 24, // Adjust width if needed
//                           colorFilter: ColorFilter.mode(
//                             Colors.grey
//                                 .shade700, // Set the icon color to grey shade 700
//                             BlendMode
//                                 .srcIn, // Ensures the SVG is filled with the grey color
//                           ),
//                         ),
//                         onPressed: () {}, // Fan action
//                       ),
//                     ],
//                   ),
//                   // Delete button on the bottom right
//                   IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.grey),
//                     onPressed: onDelete, // Delete the card from the frontend
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RoomSelection extends StatefulWidget {
//   @override
//   _RoomSelectionState createState() => _RoomSelectionState();
// }

// class _RoomSelectionState extends State<RoomSelection> {
//   List<Map<String, String>> rooms = [
//     {'name': 'Living Room', 'imagePath': 'assets/images/livingRoom.png'},
//     {'name': 'Bedroom', 'imagePath': 'assets/images/bedroom.png'},
//     {'name': 'Kitchen', 'imagePath': 'assets/images/kitchen.png'},
//     {'name': 'Guest Room', 'imagePath': 'assets/images/guestRoom.png'},
//     {'name': 'Bathroom', 'imagePath': 'assets/images/bathroom.png'},
//   ];

//   void _deleteRoom(int index) {
//     setState(() {
//       rooms.removeAt(index); // Remove the card from the frontend
//     });
//   }

//   void _navigateToDetailScreen() {
//     // Implement navigation logic here
//     print('Navigate to room details');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Room Selection")),
//       body: ListView.builder(
//         itemCount: rooms.length,
//         itemBuilder: (context, index) {
//           final room = rooms[index];
//           return RoomCard(
//             roomName: room['name']!,
//             imagePath: room['imagePath']!,
//             onDelete: () => _deleteRoom(index), // Handle delete for this card
//             onTap: _navigateToDetailScreen, // Handle navigation
//           );
//         },
//       ),
//     );
//   }
// }

class RoomCard extends StatelessWidget {
  final String roomId;
  final String roomName;
  final String imagePath;
  final VoidCallback onDelete;
  final VoidCallback onTap; // You can keep this if you have other usages

  const RoomCard({
    Key? key,
    required this.roomId,
    required this.roomName,
    required this.imagePath,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);


  // Function to show the delete confirmation dialog
void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this room?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onDelete(); // Call the onDelete function
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    print('Building RoomCard for roomId: $roomId');
    return Consumer<DeviceProvider>(
      builder: (context, provider, child) {
        // Get devices from the provider for this room
        final devices =
            Provider.of<DeviceProvider>(context).getDevicesForRoom(roomId);
        print('Devices in room $roomId: $devices');
        // Build device icons based on the devices
        List<Widget> deviceIcons = devices.toSet().map<Widget>((device) {
          IconData? icon;
          switch (device) {
            case 'Smart Tv':
              icon = Icons.tv;
              break;
            case 'AC':
              icon = Icons.ac_unit;
              break;
            case 'Heater':
              icon = Icons.fireplace;
              break;
            case 'Light 1':
            case 'Light 2':
              icon = Icons.lightbulb;
              break;
            case 'Fan':
              icon = Icons.mode_fan_off_outlined;
              break;
            default:
              icon = null;
          }

          return icon != null
              ? Icon(icon, color: Colors.grey)
              : SizedBox.shrink();
        }).toList();

        return GestureDetector(
          onTap: () {
            // Navigate to the roomDetails screen when card is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoomDetails(
                  roomName: roomName, // Pass the room name dynamically
                  imagePath: imagePath, // Pass the image path dynamically
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    roomName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: deviceIcons),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.grey),
                        onPressed: () {
                          _showDeleteConfirmationDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

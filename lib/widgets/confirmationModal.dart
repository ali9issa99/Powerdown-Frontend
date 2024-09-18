import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';


class ConfirmationModal extends StatelessWidget {
  final String selectedRoom;
  final Function(String roomName)? onRoomAdded;

  const ConfirmationModal({
    Key? key,
    required this.selectedRoom,
    this.onRoomAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.task_alt_outlined,
                color: Color.fromARGB(255, 88, 146, 50),
                size: 140,
              ),
              const SizedBox(height: 45),
              Text(
                '$selectedRoom was Added!',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  // if (onRoomAdded != null) {
                  //   onRoomAdded!(selectedRoom); // Add room to provider
                  //   // Add room to provider
                  //   Provider.of<DeviceProvider>(context, listen: false)
                  //       .addRoom(selectedRoom, _getRoomImagePath(selectedRoom));
                  // }
                  Provider.of<DeviceProvider>(context, listen: false)
                         .pushRoom();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004B43),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getRoomImagePath(String roomName) {
    switch (roomName) {
      case 'Living Room':
        return 'assets/images/livingRoom.png';
      case 'Bedroom':
        return 'assets/images/bedroom.png';
      case 'Kitchen':
        return 'assets/images/kitchen.png';
      case 'Guest Room':
        return 'assets/images/guestRoom.png';
      case 'Bathroom':
        return 'assets/images/bathroom.png';
      default:
        return 'assets/images/defaultRoom.png';
    }
  }
}












// import 'package:flutter/material.dart';

// class ConfirmationModal extends StatelessWidget {
//   final String selectedRoom;
//   final void Function(String) onRoomAdded; // Ensure this parameter exists

//   const ConfirmationModal({
//     Key? key,
//     required this.selectedRoom,
//     required this.onRoomAdded,
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
//             'Confirm Adding $selectedRoom',
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 40),
//           ElevatedButton(
//             onPressed: () {
//               onRoomAdded(selectedRoom); // Call the callback
//               Navigator.pop(context); // Close the modal
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF004B43),
//               minimumSize: const Size.fromHeight(48),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//             ),
//             child: const Text(
//               'Done',
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

// class ConfirmationModal extends StatelessWidget {
//   final String selectedRoom;
//   final Function(String roomName)? onRoomAdded;

//   const ConfirmationModal({
//     Key? key,
//     required this.selectedRoom,
//     this.onRoomAdded, // Update constructor
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       builder: (context, scrollController) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 40),
//               const Icon(
//                 Icons.task_alt_outlined,
//                 color: Color.fromARGB(255, 88, 146, 50),
//                 size: 140,
//               ),
//               const SizedBox(height: 45),
//               Text(
//                 '$selectedRoom was Added!',
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 75),
//               ElevatedButton(
//                 onPressed: () {
//                   if (onRoomAdded != null) {
//                     onRoomAdded!(selectedRoom); // Add room logic here
//                   }
//                   Navigator.pop(context); // Close ConfirmationModal
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF004B43),
//                   minimumSize: const Size.fromHeight(48),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Done',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

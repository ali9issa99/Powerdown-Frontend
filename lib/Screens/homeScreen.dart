// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:powerdown_frontend/provider/roomProvider.dart';
// import 'package:powerdown_frontend/widgets/navbar.dart';
// import 'package:powerdown_frontend/widgets/addRoomModal.dart';
// import 'package:powerdown_frontend/widgets/confirmationModal.dart';
// import 'package:powerdown_frontend/widgets/roomCard.dart';
// import 'package:provider/provider.dart';

// class AddRoomScreen extends StatefulWidget {
//   const AddRoomScreen({super.key});

//   @override
//   _AddRoomScreenState createState() => _AddRoomScreenState();
// }

// class _AddRoomScreenState extends State<AddRoomScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     if (index != _selectedIndex) {
//       if (index == 0) {
//         Navigator.pushNamed(context, '/addRoom');
//       } else if (index == 1) {
//         Navigator.pushNamed(context, '/analytics');
//       } else if (index == 2) {
//         Navigator.pushNamed(context, '/achievements');
//       } else if (index == 3) {
//         Navigator.pushNamed(context, '/profile');
//       }

//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   void _showAddRoomModal() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           builder: (context, scrollController) {
//             return const AddRoomModal();
//           },
//         );
//       },
//     );
//   }

// // gesturedetecter
//   // void _showAddDeviceModal(String selectedRoom) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     backgroundColor: Colors.transparent,
//   //     isScrollControlled: true,
//   //     builder: (context) {
//   //       return DraggableScrollableSheet(
//   //         expand: false,
//   //         builder: (context, scrollController) {
//   //           return AddDeviceModal(
//   //               selectedRoom: selectedRoom); // Pass selectedRoom
//   //         },
//   //       );
//   //     },
//   //   );
//   // }

//   void _showConfirmationModal(String selectedRoom) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           builder: (context, scrollController) {
//             return ConfirmationModal(
//               selectedRoom: selectedRoom,
//               onRoomAdded: _addRoom,
//             );
//           },
//         );
//       },
//     );
//   }

//   void _addRoom(String roomName) {
//     setState(() {
//       // You can manage rooms here
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'My Home',
//           style: TextStyle(
//             fontSize: 29,
//             fontWeight: FontWeight.w600,
//             backgroundColor: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: _showAddRoomModal,
//             icon: SvgPicture.asset(
//               'assets/icons/plus.svg',
//               width: 32,
//               height: 32,
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Consumer<deviceProvider>(
//           builder: (context, room, child) {
//             return (room.selectedRooms.isEmpty)
//                 ? const Text(
//                     'Click on the add button to add\n"Rooms" and "Devices"',
//                     style: TextStyle(
//                       fontSize: 28,
//                       color: Colors.grey,
//                     ),
//                     textAlign: TextAlign.center,
//                   )
//                 : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: room.selectedRooms.length,
//                           itemBuilder: (context, index) {
//                             return RoomCard(
//                               roomName: room.selectedRooms[index],
//                               imagePath: 'assets/images/bedroom.png',
//                               // devices: [], // Add relevant devices list
//                               onDelete: () {
//                                 setState(() {
//                                   room.selectedRooms.removeAt(index);
//                                 });
//                               },
//                               onTap: () {
//                                 // Navigate to the room's details
//                                 Navigator.pushNamed(
//                                     context, '/roomDetails'); // Dummy route
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';
import 'package:powerdown_frontend/widgets/addRoomModal.dart';
import 'package:powerdown_frontend/widgets/addDeviceModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart';
import 'package:powerdown_frontend/widgets/roomCard.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  int _selectedIndex = 0;
  String? _selectedRoom;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushNamed(context, '/addRoom');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/analytics');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/achievements');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/profile');
      }

      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showAddRoomModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return AddRoomModal(
              onRoomSelected: (roomName) {
                setState(() {
                  _selectedRoom = roomName; // Store selected room
                });
                _showAddDeviceModal(roomName); // Show add device modal
              },
            );
          },
        );
      },
    );
  }

  void _showAddDeviceModal(String selectedRoom) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return AddDeviceModal(
              selectedRoom: selectedRoom,
              onRoomAdded: _addRoom, // Pass callback to add room
            );
          },
        );
      },
    );
  }

  void _showConfirmationModal(String selectedRoom) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return ConfirmationModal(
              selectedRoom: selectedRoom,
              onRoomAdded: _addRoom, // Pass callback to add room
            );
          },
        );
      },
    );
  }

  // Function to get the image path based on room name
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

  // Add room along with image path
  void _addRoom(String roomName) {
    String imagePath =
        _getRoomImagePath(roomName); // Get image path based on room name
    Provider.of<deviceProvider>(context, listen: false)
        .addRoom(roomName, imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Home',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _showAddRoomModal,
            icon: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<deviceProvider>(
          builder: (context, roomProvider, child) {
            return roomProvider.selectedRooms.isEmpty
                ? const Text(
                    'Click on the add button to add\n"Rooms" and "Devices"',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  )
                : ListView.builder(
                    itemCount: roomProvider.selectedRooms.length,
                    itemBuilder: (context, index) {
                      final room = roomProvider.selectedRooms[index];
                      return RoomCard(
                        roomName: room['name']!,
                        imagePath:
                            room['imagePath']!, // Use image path from the list
                        onDelete: () {
                          roomProvider.removeRoom(index);
                        },
                        onTap: () {
                          // Navigate to the room's details
                          Navigator.pushNamed(
                              context, '/roomDetails'); // Dummy route
                        },
                      );
                    },
                  );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
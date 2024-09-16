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
      backgroundColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return AddRoomModal(
              onRoomSelected: (roomName) {
                setState(() {
                  _selectedRoom = roomName; // Store the selected room
                });
                Navigator.pop(context);
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
 
      isScrollControlled: true,
      builder: (context) {
        return AddDeviceModal(
          selectedRoomId: selectedRoom,
          onRoomAdded: (roomName) {
            _showConfirmationModal(roomName);
          },
        );
      },
    );
  }

  void _showConfirmationModal(String roomName) {
    showModalBottomSheet(
      context: context,
      backgroundColor:
          Colors.white, // Transparent background for the modal sheet
      isScrollControlled: true,
      builder: (context) {
        return Stack(
          children: [
            ModalBarrier(
              dismissible: true,
            ),
            // The modal content goes on top of the barrier
            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Modal content
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: ConfirmationModal(
                selectedRoom: roomName,
                onRoomAdded: (roomName) {
                  _addRoom(roomName); // Add room to provider
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _addRoom(String roomName) {
    String imagePath =
        _getRoomImagePath(roomName); // Get image path based on room name
    Provider.of<DeviceProvider>(context, listen: false)
        .addRoom(roomName, imagePath); // Add the room to the list
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

  // // Add room along with image path
  // void _addRoom(String roomName) {
  //   String imagePath =
  //       _getRoomImagePath(roomName); // Get image path based on room name
  //   Provider.of<deviceProvider>(context, listen: false)
  //       .addRoom(roomName, imagePath);
  // }

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
        child: Consumer<DeviceProvider>(
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
                        roomId: room.id, // Pass roomId here
                        roomName: room.name, // Room name
                        imagePath:
                            room.imagePath, // Image path for the room
                        onDelete: () {
                          roomProvider.removeRoom(
                              room.id); // Use removeRoom with roomId
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

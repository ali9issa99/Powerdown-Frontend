import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';
import 'package:powerdown_frontend/widgets/addRoomModal.dart'; // Import AddRoomModal
// import 'package:powerdown_frontend/widgets/addDeviceModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart';
import 'package:powerdown_frontend/widgets/roomCard.dart';
import 'package:provider/provider.dart'; // Import AddDeviceModal

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  int _selectedIndex = 0; // Tracks the selected index
  List<String> _rooms = []; // List to keep track of rooms

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
      _selectedIndex = index;  // Update the index after navigation
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
            return const AddRoomModal(); // Use the AddRoomModal widget
          },
        );
      },
    );
  }
// gesturedetecter
  // void _showAddDeviceModal(String selectedRoom) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return DraggableScrollableSheet(
  //         expand: false,
  //         builder: (context, scrollController) {
  //           return AddDeviceModal(
  //               selectedRoom: selectedRoom); // Pass selectedRoom
  //         },
  //       );
  //     },
  //   );
  // }

  // Method to show confirmation modal after adding room
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
              onRoomAdded: _addRoom, // Make sure this is passed correctly
            );
          },
        );
      },
    );
  }

  // Callback to add the room to the list
  void _addRoom(String roomName) {
    setState(() {
      _rooms.add(roomName);
    });
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
        automaticallyImplyLeading: false, // Removes the back arrow
        actions: [
          IconButton(
            onPressed: _showAddRoomModal, // Show the add room modal
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
          builder: (context,room,child){
            return  (room.selectedRooms.isEmpty)?
                const Text(
                  'Click on the add button to add\n"Rooms" and "Devices"',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                child: ListView.builder(
                  itemCount: room.selectedRooms.length,
                  itemBuilder: (context, index) {
                    return RoomCard(
                      roomName: room.selectedRooms[index],
                      imagePath:
                          'assets/google.png', // Provide a valid image path or a placeholder
                      // devices: [], // Assuming no devices initially
                      onDelete: () {
                        setState(() {
                          _rooms.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
              // if (_rooms.isEmpty) const Spacer(flex: 2),
              
              // if (_rooms.isEmpty) const Spacer(flex: 2),
            ],
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

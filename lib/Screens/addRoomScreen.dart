import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';
import 'package:powerdown_frontend/widgets/addRoomModal.dart'; // Import AddRoomModal
import 'package:powerdown_frontend/widgets/addDeviceModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart'; // Import AddDeviceModal

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  int _selectedIndex = 0; // Tracks the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

  void _showAddDeviceModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return const AddDeviceModal(); // Use the AddDeviceModal widget
          },
        );
      },
    );
  }


   // Method to show confirmation modal after adding room
  void _showConfirmationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return const ConfirmationModal(); // Use the ConfirmationModal widget
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Home',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(flex: 2),
            Text(
              'Click on the add button to add\n"Rooms" and "Devices"',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

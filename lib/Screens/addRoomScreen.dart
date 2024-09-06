import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import the BottomNavBar

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
      backgroundColor: Colors.transparent, // Makes the background transparent
      isScrollControlled: true, // To make the modal fullscreen if needed
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Room',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: DropdownButtonFormField<String>(
                      value: 'Living Room',
                      items: const [
                        DropdownMenuItem(
                          value: 'Living Room',
                          child: Text('Living Room'),
                        ),
                        DropdownMenuItem(
                          value: 'Bedroom',
                          child: Text('Bedroom'),
                        ),
                        DropdownMenuItem(
                          value: 'Kitchen',
                          child: Text('Kitchen'),
                        ),
                        DropdownMenuItem(
                          value: 'Guest Room',
                          child: Text('Guest Room'),
                        ),
                        DropdownMenuItem(
                          value: 'Bathroom',
                          child: Text('Bathroom'),
                        ),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // Handle continue button press
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
                      Navigator.pop(context); // Close the modal
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
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
            onPressed: () {
              _showAddRoomModal(); // Show the modal when plus icon is pressed
            },
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

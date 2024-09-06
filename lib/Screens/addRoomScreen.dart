import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adapts to the content size
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns content to the left
                children: [
                  const SizedBox(
                      height: 25), // Adds space above the "Room" text
                  const Align(
                    alignment: Alignment.topLeft, // Aligns text to the top-left
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
                    // width: 300, // Set the width of the dropdown
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0), // Adds vertical padding
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
                      onChanged: (value) {
                        // Handle dropdown value change
                      },
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
                      backgroundColor:
                          const Color(0xFF004B43), // Your desired color
                      minimumSize: const Size.fromHeight(48), // Button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the modal
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Your desired color
                      minimumSize: const Size.fromHeight(48), // Button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Back'),
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
              'assets/icons/plus.svg', // Path to your custom icon
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2), // Decrease this value to move text up
            const Text(
              'Click on the add button to add\n"Rooms" and "Devices"',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2), // Increase this value to move text up
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Sets the current index
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped, // Handles tap events
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0
                  ? 'assets/activeIcons/home.svg' // Path to the active icon
                  : 'assets/icons/home.svg', // Path to the inactive icon
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1
                  ? 'assets/activeIcons/analytics.svg' // Path to the active icon
                  : 'assets/icons/analytics.svg', // Path to the inactive icon
              width: 24,
              height: 24,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset(
                    'assets/activeIcons/achievements.png', // Path to the active PNG icon
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/achievements.svg', // Path to the inactive SVG icon
                    width: 24,
                    height: 24,
                  ),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3
                  ? 'assets/activeIcons/profile.svg' // Path to the active icon
                  : 'assets/icons/profile.svg', // Path to the inactive icon
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

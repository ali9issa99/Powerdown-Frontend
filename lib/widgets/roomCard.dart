import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final String imagePath;
  final VoidCallback onDelete;
  final VoidCallback onTap; // Added for card tap navigation

  const RoomCard({
    Key? key,
    required this.roomName,
    required this.imagePath,
    required this.onDelete,
    required this.onTap, // For navigation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to the screen when the card is pressed
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room image at the top
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
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Device icons on the bottom left
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.tv), // Smart TV
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.ac_unit), // AC
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.fireplace), // Heater
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.lightbulb), // Light 1
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/fan1.svg', // Fan SVG
                          height: 24, // Adjust height if needed
                          width: 24, // Adjust width if needed
                          colorFilter: ColorFilter.mode(
                            Colors.grey
                                .shade700, // Set the icon color to grey shade 700
                            BlendMode
                                .srcIn, // Ensures the SVG is filled with the grey color
                          ),
                        ),
                        onPressed: () {}, // Fan action
                      ),
                    ],
                  ),
                  // Delete button on the bottom right
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.grey),
                    onPressed: onDelete, // Delete the card from the frontend
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomSelection extends StatefulWidget {
  @override
  _RoomSelectionState createState() => _RoomSelectionState();
}

class _RoomSelectionState extends State<RoomSelection> {
  List<Map<String, String>> rooms = [
    {'name': 'Living Room', 'imagePath': 'assets/images/livingRoom.png'},
    {'name': 'Bedroom', 'imagePath': 'assets/images/bedroom.png'},
    {'name': 'Kitchen', 'imagePath': 'assets/images/kitchen.png'},
    {'name': 'Guest Room', 'imagePath': 'assets/images/guestRoom.png'},
    {'name': 'Bathroom', 'imagePath': 'assets/images/bathroom.png'},
  ];

  void _deleteRoom(int index) {
    setState(() {
      rooms.removeAt(index); // Remove the card from the frontend
    });
  }

  void _navigateToDetailScreen() {
    // Implement navigation logic here
    print('Navigate to room details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room Selection")),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return RoomCard(
            roomName: room['name']!,
            imagePath: room['imagePath']!,
            onDelete: () => _deleteRoom(index), // Handle delete for this card
            onTap: _navigateToDetailScreen, // Handle navigation
          );
        },
      ),
    );
  }
}

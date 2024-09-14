import 'package:flutter/material.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
// import 'package:powerdown_frontend/widgets/addDeviceModal.dart';
import 'package:powerdown_frontend/widgets/confirmationModal.dart';
import 'package:provider/provider.dart';

class AddRoomModal extends StatefulWidget {
  final void Function(String) onRoomSelected;

  const AddRoomModal({Key? key, required this.onRoomSelected})
      : super(key: key);

  @override
  State<AddRoomModal> createState() => _AddRoomModalState();
}

class _AddRoomModalState extends State<AddRoomModal> {
  String _selectedRoom = 'Living Room'; // Default value
  String _pendingRoom = ''; // To store the room temporarily

  @override
  Widget build(BuildContext context) {
    final room = Provider.of<deviceProvider>(context);
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
              color: Colors.white,
              child: DropdownButtonFormField<String>(
                value: _selectedRoom,
                dropdownColor: Colors.white,
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
                  setState(() {
                    _selectedRoom = value!;
                  });
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
                setState(() {
                  _pendingRoom = _selectedRoom; // Store the selected room
                });
                // Open the confirmation modal
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) {
                    return ConfirmationModal(
                      selectedRoom: _pendingRoom,
                      onRoomAdded: (roomName) {
                        room.addRoom(
                            roomName, ''); // Add the room when done is pressed
                      },
                    );
                  },
                );
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ));
  }
}

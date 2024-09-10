import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/addDeviceModal.dart'; // Import the AddDeviceModal

class AddRoomModal extends StatefulWidget {
  const AddRoomModal({Key? key}) : super(key: key);

  @override
  State<AddRoomModal> createState() => _AddRoomModalState();
}

class _AddRoomModalState extends State<AddRoomModal> {
  String _selectedRoom = 'Living Room'; // Default value

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context); // Close the current modal

              // Open AddDeviceModal and pass the selected room
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    builder: (context, scrollController) {
                      return AddDeviceModal(selectedRoom: _selectedRoom); // Pass the room
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
                side: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            child: const Text(
              'Back',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}


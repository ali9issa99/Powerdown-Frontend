import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/addDeviceModal.dart'; // Import the AddDeviceModal

class AddRoomModal extends StatelessWidget {
  const AddRoomModal({Key? key}) : super(key: key);

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
              Navigator.pop(context); // Close the current modal
              // Then, open the AddDeviceModal
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    builder: (context, scrollController) {
                      return const AddDeviceModal(); // Open the AddDeviceModal
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
              backgroundColor: Colors.white, // Same as before, or change as needed
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Optional: border around back button
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final String imagePath;
  final List<String> devices; // List of device icons
  final VoidCallback onDelete;

  const RoomCard({
    Key? key,
    required this.roomName,
    required this.imagePath,
    required this.devices,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Room image
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            // Room name and devices
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Device icons
                  Row(
                    children: devices.map((deviceIcon) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          deviceIcon,
                          width: 24,
                          height: 24,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // Delete button (bin icon)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

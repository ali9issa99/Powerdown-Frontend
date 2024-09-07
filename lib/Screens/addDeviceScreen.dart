// import 'package:flutter/material.dart';

// class AddDeviceScreen extends StatefulWidget {
//   const AddDeviceScreen({super.key});

//   @override
//   _AddDeviceScreenState createState() => _AddDeviceScreenState();
// }

// class _AddDeviceScreenState extends State<AddDeviceScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Show the modal when the widget is fully loaded
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showAddDeviceModal();
//     });
//   }

//   void _showAddDeviceModal() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           builder: (context, scrollController) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//               ),
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 4,
//                       width: 40,
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Center(
//                     child: Text(
//                       'Add devices',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       childAspectRatio: 2.5,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       children: [
//                         _buildDeviceTile('Smart TV', Icons.tv),
//                         _buildDeviceTile('AC', Icons.ac_unit),
//                         _buildDeviceTile('Heater', Icons.heat_pump),
//                         _buildDeviceTile('Light 1', Icons.light),
//                         _buildDeviceTile('Fan', Icons.toys),
//                         _buildDeviceTile('Light 2', Icons.lightbulb),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle continue button press
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF004B43),
//                       minimumSize: const Size.fromHeight(48),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                     ),
//                     child: const Text(
//                       'Continue',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context); // Close the modal
//                     },
//                     child: const Text('Back', style: TextStyle(fontSize: 18)),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildDeviceTile(String deviceName, IconData iconData) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(iconData, size: 30),
//             Expanded(
//               child: Text(
//                 deviceName,
//                 style: const TextStyle(fontSize: 16),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.add_circle_outline),
//                   onPressed: () {
//                     // Logic to add device
//                   },
//                   constraints: BoxConstraints(),
//                   padding: EdgeInsets.zero, // Remove extra padding
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.remove_circle_outline),
//                   onPressed: () {
//                     // Logic to remove device
//                   },
//                   constraints: BoxConstraints(),
//                   padding: EdgeInsets.zero, // Remove extra padding
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // No need to have anything in the body since the modal is triggered automatically
//     return const SizedBox.shrink();
//   }
// }

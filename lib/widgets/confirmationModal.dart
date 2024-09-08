import 'package:flutter/material.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.task_alt_outlined,
                color: Color.fromARGB(255, 88,146,50),
                size: 140,
              ),
              const SizedBox(height: 45),
              const Text(
                'Living Room Added!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Closes the modal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004B43),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

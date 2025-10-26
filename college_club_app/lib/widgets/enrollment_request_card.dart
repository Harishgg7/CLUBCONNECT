import 'package:flutter/material.dart';

class EnrollmentRequestCard extends StatelessWidget {
  final String studentName;
  final String studentId;
  final String year;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const EnrollmentRequestCard({
    Key? key,
    required this.studentName,
    required this.studentId,
    required this.year,
    required this.onApprove,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade100,
              child: Text(
                studentName[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    studentId,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    year,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),
              onPressed: onApprove,
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red, size: 30),
              onPressed: onReject,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/enrollment_request_card.dart';

class EnrollmentScreen extends StatefulWidget {
  const EnrollmentScreen({super.key});

  @override
  State<EnrollmentScreen> createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
  final List<Map<String, String>> _pendingRequests = [
    {'name': 'Alice Johnson', 'id': 'RA2211001010123', 'year': '2nd Year'},
    {'name': 'Bob Smith', 'id': 'RA2211001010124', 'year': '3rd Year'},
    {'name': 'Charlie Brown', 'id': 'RA2211001010125', 'year': '1st Year'},
    {'name': 'David Wilson', 'id': 'RA2211001010126', 'year': '2nd Year'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enrollment Requests',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Review and manage student enrollment requests',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  'Pending',
                  '${_pendingRequests.length}',
                  Colors.orange,
                ),
                _buildStatCard('Approved', '45', Colors.green),
                _buildStatCard('Rejected', '12', Colors.red),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _pendingRequests.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox,
                            size: 100,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No pending requests',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _pendingRequests.length,
                      itemBuilder: (context, index) {
                        final request = _pendingRequests[index];
                        return EnrollmentRequestCard(
                          studentName: request['name']!,
                          studentId: request['id']!,
                          year: request['year']!,
                          onApprove: () =>
                              _handleApprove(index, request['name']!),
                          onReject: () =>
                              _handleReject(index, request['name']!),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleApprove(int index, String name) {
    setState(() {
      _pendingRequests.removeAt(index);
    });
    _showSnackBar('Approved $name', Colors.green);
  }

  void _handleReject(int index, String name) {
    setState(() {
      _pendingRequests.removeAt(index);
    });
    _showSnackBar('Rejected $name', Colors.red);
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

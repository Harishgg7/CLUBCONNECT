import 'package:flutter/material.dart';
import 'club_chat_screen.dart';

class MyClubScreen extends StatelessWidget {
  final String studentId;

  const MyClubScreen({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isInClub = true;

    if (!isInClub) {
      return Center(
        child: SingleChildScrollView(
          // Add scroll view
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.inbox, size: 100, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              Text(
                'You haven\'t joined any club yet',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Explore Clubs'),
              ),
            ],
          ),
        ),
      );
    }

    return ClubChatScreen(clubName: 'Tech Club', studentId: studentId);
  }
}

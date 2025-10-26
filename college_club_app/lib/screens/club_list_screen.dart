import 'package:flutter/material.dart';
import 'club_detail_screen.dart';

class ClubListScreen extends StatelessWidget {
  const ClubListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clubs = [
      {'name': 'Tech Club', 'members': 150, 'category': 'Technology'},
      {'name': 'Music Club', 'members': 80, 'category': 'Arts'},
      {'name': 'Sports Club', 'members': 200, 'category': 'Sports'},
      {'name': 'Drama Club', 'members': 60, 'category': 'Arts'},
      {'name': 'Coding Club', 'members': 120, 'category': 'Technology'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        // Add scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore Clubs',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Find and join clubs that match your interests',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search clubs...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Use Wrap or Column with proper spacing
              GridView.builder(
                shrinkWrap:
                    true, // Important: makes GridView work in SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView scroll
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  final club = clubs[index];
                  return _buildClubCard(context, club);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, Map<String, dynamic> club) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClubDetailScreen(clubName: club['name']),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.groups, size: 50, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                club['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                club['category'],
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.people, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    '${club['members']} members',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

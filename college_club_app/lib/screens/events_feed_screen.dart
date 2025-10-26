import 'package:flutter/material.dart';
import '../widgets/event_card.dart';

class EventsFeedScreen extends StatelessWidget {
  const EventsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'title': 'Hackathon 2025',
        'club': 'Tech Club',
        'date': 'Nov 15, 2025',
        'time': '9:00 AM',
        'location': 'Auditorium',
      },
      {
        'title': 'Music Fest',
        'club': 'Music Club',
        'date': 'Nov 20, 2025',
        'time': '5:00 PM',
        'location': 'Open Theater',
      },
      {
        'title': 'Sports Day',
        'club': 'Sports Club',
        'date': 'Nov 25, 2025',
        'time': '7:00 AM',
        'location': 'Sports Ground',
      },
    ];

    return SingleChildScrollView(
      // Add scrolling to prevent overflow
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Stay updated with all club activities',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            // Use Column instead of Expanded ListView
            ...events
                .map(
                  (event) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: EventCard(
                      title: event['title']!,
                      clubName: event['club']!,
                      date: event['date']!,
                      time: event['time']!,
                      location: event['location']!,
                      onLearnMore: () {},
                      onRegister: () {},
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

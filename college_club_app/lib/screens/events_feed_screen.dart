import 'package:college_club_app/widgets/event_card.dart';
import 'package:flutter/material.dart';

// This is the Student's "Events" screen
class EventsFeedScreen extends StatelessWidget {
  const EventsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This is the same code from our old 'home_screen.dart'
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        EventCard(
          clubName: 'Tech Club',
          eventName: 'Intro to Flutter Workshop',
          date: 'Oct 28, 7:00 PM',
        ),
        EventCard(
          clubName: 'Photography Club',
          eventName: 'Campus Photo Walk',
          date: 'Oct 29, 4:00 PM',
        ),
      ],
    );
  }
}

import 'package:college_club_app/screens/club_list_screen.dart';
import 'package:college_club_app/screens/events_feed_screen.dart';
import 'package:college_club_app/screens/my_club_screen.dart';
import 'package:college_club_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class StudentShell extends StatefulWidget {
  const StudentShell({super.key});

  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  // This will hold the currently selected screen
  Widget _selectedScreen = const EventsFeedScreen();
  String _title = 'Events';

  // This is the "brain" that opens and closes the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // This function will be passed to the Drawer to update the screen
  void _selectScreen(String screenName) {
    setState(() {
      if (screenName == 'Clubs') {
        _selectedScreen = const ClubListScreen();
        _title = 'Clubs';
      } else if (screenName == 'Events') {
        _selectedScreen = const EventsFeedScreen();
        _title = 'Events';
      } else if (screenName == 'My Club') {
        _selectedScreen = const MyClubScreen();
        _title = 'My Club';
      }
    });
    // Close the drawer
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach the key
      appBar: AppBar(
        title: Text(_title),
        // This is the new "expand menu" button
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // This tells the scaffold to open the drawer
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      // This is your "expand menu"
      drawer: AppDrawer(
        onSelectItem: _selectScreen,
        // We pass the list of items for the STUDENT
        menuItems: const [
          {'title': 'Events', 'icon': Icons.event},
          {'title': 'Clubs', 'icon': Icons.explore},
          {'title': 'My Club', 'icon': Icons.chat_bubble},
        ],
      ),
      body: _selectedScreen,
    );
  }
}

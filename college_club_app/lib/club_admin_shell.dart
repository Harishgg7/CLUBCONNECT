import 'package:college_club_app/screens/club_chat_screen.dart';
import 'package:college_club_app/screens/enrollment_screen.dart';
import 'package:college_club_app/screens/manage_events_screen.dart';
import 'package:college_club_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ClubAdminShell extends StatefulWidget {
  const ClubAdminShell({super.key});

  @override
  State<ClubAdminShell> createState() => _ClubAdminShellState();
}

class _ClubAdminShellState extends State<ClubAdminShell> {
  Widget _selectedScreen = const EnrollmentScreen();
  String _title = 'Enrollment';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _selectScreen(String screenName) {
    setState(() {
      if (screenName == 'Enrollment') {
        _selectedScreen = const EnrollmentScreen();
        _title = 'Enrollment';
      } else if (screenName == 'Events') {
        _selectedScreen = const ManageEventsScreen();
        _title = 'Manage Events';
      } else if (screenName == 'Club Chat') {
        _selectedScreen = const ClubChatScreen();
        _title = 'Club Chat';
      }
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: AppDrawer(
        onSelectItem: _selectScreen,
        // We pass the list of items for the CLUB ADMIN
        menuItems: const [
          {'title': 'Enrollment', 'icon': Icons.person_add},
          {'title': 'Events', 'icon': Icons.edit_calendar},
          {'title': 'Club Chat', 'icon': Icons.chat_bubble},
        ],
      ),
      body: _selectedScreen,
    );
  }
}

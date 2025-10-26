import 'package:flutter/material.dart';
import 'club_list_screen.dart';
import 'events_feed_screen.dart';
import 'my_club_screen.dart';

class StudentShell extends StatefulWidget {
  final String studentId;

  const StudentShell({Key? key, required this.studentId}) : super(key: key);

  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  int _selectedIndex = 0;
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClubConnect - Student'),
        leading: IconButton(
          icon: Icon(_isDrawerOpen ? Icons.menu_open : Icons.menu),
          onPressed: () {
            setState(() {
              _isDrawerOpen = !_isDrawerOpen;
            });
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: Row(
        children: [
          // Drawer - now uses fixed width instead of AnimatedContainer
          if (_isDrawerOpen)
            Container(
              width: 250,
              color: Colors.grey.shade100,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.purple.shade400],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person, size: 40),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.studentId,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildMenuItem(icon: Icons.groups, title: 'Clubs', index: 0),
                  _buildMenuItem(icon: Icons.event, title: 'Events', index: 1),
                  _buildMenuItem(icon: Icons.chat, title: 'My Club', index: 2),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ],
              ),
            ),
          // Main content - now expands to fill remaining space
          Expanded(child: _getSelectedScreen()),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey.shade700,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue.shade50,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const ClubListScreen();
      case 1:
        return const EventsFeedScreen();
      case 2:
        return MyClubScreen(studentId: widget.studentId);
      default:
        return const ClubListScreen();
    }
  }
}

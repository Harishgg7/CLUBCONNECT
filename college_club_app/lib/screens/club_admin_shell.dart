import 'package:flutter/material.dart';
import './enrollment_screen.dart';
import './manage_events_screen.dart';
import './club_chat_screen.dart';

class ClubAdminShell extends StatefulWidget {
  final String clubEmail;

  const ClubAdminShell({Key? key, required this.clubEmail}) : super(key: key);

  @override
  State<ClubAdminShell> createState() => _ClubAdminShellState();
}

class _ClubAdminShellState extends State<ClubAdminShell> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClubConnect - Admin'),
        leading: IconButton(
          icon: Icon(_isExpanded ? Icons.menu_open : Icons.menu),
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isExpanded ? 250 : 0,
            child: _isExpanded
                ? Container(
                    color: Colors.grey.shade100,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.shade400,
                                Colors.red.shade400,
                              ],
                            ),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.groups, size: 40),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Tech Club Admin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildMenuItem(
                          icon: Icons.how_to_reg,
                          title: 'Enrollment',
                          index: 0,
                        ),
                        _buildMenuItem(
                          icon: Icons.event,
                          title: 'Events',
                          index: 1,
                        ),
                        _buildMenuItem(
                          icon: Icons.chat,
                          title: 'Club Chat',
                          index: 2,
                        ),
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
                  )
                : null,
          ),
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
        color: isSelected ? Colors.orange : Colors.grey.shade700,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.orange.shade50,
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
        return const EnrollmentScreen();
      case 1:
        return const ManageEventsScreen();
      case 2:
        return const ClubChatScreen(clubName: 'Tech Club', studentId: 'Admin');
      default:
        return const EnrollmentScreen();
    }
  }
}

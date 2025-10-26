import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String userId;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<DrawerMenuItem> menuItems;
  final bool isClubAdmin;

  const AppDrawer({
    Key? key,
    required this.userId,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.menuItems,
    this.isClubAdmin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isClubAdmin
                    ? [Colors.orange.shade400, Colors.red.shade400]
                    : [Colors.blue.shade400, Colors.purple.shade400],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    isClubAdmin ? Icons.groups : Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userId,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...menuItems.asMap().entries.map((entry) {
            return _buildMenuItem(
              icon: entry.value.icon,
              title: entry.value.title,
              index: entry.key,
            );
          }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings
            },
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
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    final Color selectedColor = isClubAdmin ? Colors.orange : Colors.blue;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? selectedColor : Colors.grey.shade700,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? selectedColor : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: isClubAdmin
          ? Colors.orange.shade50
          : Colors.blue.shade50,
      onTap: () => onItemSelected(index),
    );
  }
}

class DrawerMenuItem {
  final IconData icon;
  final String title;

  DrawerMenuItem({required this.icon, required this.title});
}

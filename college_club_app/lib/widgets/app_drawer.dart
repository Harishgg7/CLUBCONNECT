import 'package:flutter/material.dart';

// This is our REUSABLE drawer widget
class AppDrawer extends StatelessWidget {
  // This function will be called when an item is tapped
  final Function(String) onSelectItem;
  // This is the list of items to display
  final List<Map<String, dynamic>> menuItems;

  const AppDrawer({
    super.key,
    required this.onSelectItem,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // This is the header of the drawer
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Club Connect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Here we build the list of items
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () {
                // When tapped, call the function that was passed in
                onSelectItem(item['title']);
              },
            );
          }).toList(),

          // A divider and a logout button
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: Add logout logic
              // For now, just pop back to the switcher
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

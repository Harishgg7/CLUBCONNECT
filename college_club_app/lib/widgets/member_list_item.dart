import 'package:flutter/material.dart';

class MemberListItem extends StatelessWidget {
  final String name;
  final String role;
  final bool isOnline;
  final VoidCallback? onTap;

  const MemberListItem({
    Key? key,
    required this.name,
    required this.role,
    this.isOnline = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(name),
      subtitle: Text(
        role,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      onTap: onTap,
    );
  }
}

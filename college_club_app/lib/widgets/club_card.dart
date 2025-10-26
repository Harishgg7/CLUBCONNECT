import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final String clubName;
  final String category;
  final int memberCount;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const ClubCard({
    Key? key,
    required this.clubName,
    required this.category,
    required this.memberCount,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.groups,
                    size: 50,
                    color: backgroundColor != null ? Colors.white : Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                clubName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                category,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.people, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    '$memberCount members',
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

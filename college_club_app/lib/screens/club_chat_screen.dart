import 'package:flutter/material.dart';
import '../widgets/chat_message.dart';
import '../widgets/chat_input.dart';
import '../widgets/member_list_item.dart';

class ClubChatScreen extends StatefulWidget {
  final String clubName;
  final String studentId;

  const ClubChatScreen({
    super.key,
    required this.clubName,
    required this.studentId,
  });

  @override
  State<ClubChatScreen> createState() => _ClubChatScreenState();
}

class _ClubChatScreenState extends State<ClubChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showMembersList = false; // Toggle for members sidebar

  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'John Doe',
      'message': 'Hey everyone! Welcome to the club!',
      'time': '10:30 AM',
      'isCurrentUser': false,
    },
    {
      'sender': 'Jane Smith',
      'message': 'Thanks for having me! Excited to be here.',
      'time': '10:32 AM',
      'isCurrentUser': false,
    },
    {
      'sender': 'Mike Johnson',
      'message': 'Can\'t wait for the next event!',
      'time': '10:35 AM',
      'isCurrentUser': false,
    },
  ];

  final List<Map<String, dynamic>> _members = [
    {'name': 'John Doe', 'role': 'President', 'isOnline': true},
    {'name': 'Jane Smith', 'role': 'Vice President', 'isOnline': true},
    {'name': 'Mike Johnson', 'role': 'Secretary', 'isOnline': false},
    {'name': 'Sarah Wilson', 'role': 'Member', 'isOnline': true},
    {'name': 'Tom Brown', 'role': 'Member', 'isOnline': false},
    {'name': 'Emma Davis', 'role': 'Member', 'isOnline': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Chat area - now takes full width when members list is hidden
        Expanded(
          child: Column(
            children: [
              // Chat header with members toggle button
              _buildChatHeader(),
              // Messages
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ChatMessage(
                      senderName: message['sender'],
                      message: message['message'],
                      time: message['time'],
                      isCurrentUser: message['isCurrentUser'] ?? false,
                    );
                  },
                ),
              ),
              // Message input
              ChatInput(
                controller: _messageController,
                onSendMessage: _sendMessage,
                onAttachmentPressed: () {
                  _showAttachmentOptions();
                },
              ),
            ],
          ),
        ),
        // Members sidebar - only shown when toggled
        if (_showMembersList)
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(left: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Members header with close button
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members — ${_members.length}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () {
                          setState(() {
                            _showMembersList = false;
                          });
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                // Members list
                Expanded(
                  child: ListView.builder(
                    itemCount: _members.length,
                    itemBuilder: (context, index) {
                      final member = _members[index];
                      return MemberListItem(
                        name: member['name'],
                        role: member['role'],
                        isOnline: member['isOnline'],
                        onTap: () {
                          // Handle member tap
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildChatHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4)],
      ),
      child: Row(
        children: [
          const Icon(Icons.tag, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.clubName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'General chat',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // Toggle members button
          IconButton(
            icon: Icon(
              _showMembersList ? Icons.people : Icons.people_outline,
              color: _showMembersList ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _showMembersList = !_showMembersList;
              });
            },
            tooltip: 'Toggle Members',
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Start video call
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Start voice call
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'sender': widget.studentId,
        'message': text,
        'time': 'Just now',
        'isCurrentUser': true,
      });
      _messageController.clear();
    });

    // Scroll to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text('Image'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file, color: Colors.orange),
              title: const Text('File'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.green),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

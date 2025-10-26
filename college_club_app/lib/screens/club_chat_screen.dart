import 'package:flutter/material.dart';

class ClubChatScreen extends StatefulWidget {
  final String clubName;
  final String studentId;

  const ClubChatScreen({
    Key? key,
    required this.clubName,
    required this.studentId,
  }) : super(key: key);

  @override
  State<ClubChatScreen> createState() => _ClubChatScreenState();
}

class _ClubChatScreenState extends State<ClubChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'John Doe', 'message': 'Hey everyone!', 'time': '10:30 AM'},
    {
      'sender': 'Jane Smith',
      'message': 'Welcome to the club!',
      'time': '10:32 AM',
    },
    {
      'sender': 'Mike Johnson',
      'message': 'Excited for the next event',
      'time': '10:35 AM',
    },
  ];

  final List<Map<String, String>> _members = [
    {'name': 'John Doe', 'role': 'President'},
    {'name': 'Jane Smith', 'role': 'Vice President'},
    {'name': 'Mike Johnson', 'role': 'Member'},
    {'name': 'Sarah Wilson', 'role': 'Member'},
    {'name': 'Tom Brown', 'role': 'Member'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Chat area
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // Chat header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.tag, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      widget.clubName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Messages
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return _buildMessage(message);
                  },
                ),
              ),
              // Message input
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Message #${widget.clubName}',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onSubmitted: _sendMessage,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => _sendMessage(_messageController.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Members sidebar
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border(left: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Members — ${_members.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _members.length,
                  itemBuilder: (context, index) {
                    final member = _members[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        child: Text(
                          member['name']![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(member['name']!),
                      subtitle: Text(
                        member['role']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
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

  Widget _buildMessage(Map<String, dynamic> message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              message['sender'][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      message['sender'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      message['time'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(message['message'], style: const TextStyle(fontSize: 14)),
              ],
            ),
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
      });
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

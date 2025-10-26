import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSendMessage;
  final VoidCallback? onAttachmentPressed;

  const ChatInput({
    Key? key,
    required this.controller,
    required this.onSendMessage,
    this.onAttachmentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (onAttachmentPressed != null)
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: onAttachmentPressed,
              color: Colors.grey.shade600,
            ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: onSendMessage,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onSendMessage(controller.text);
              }
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

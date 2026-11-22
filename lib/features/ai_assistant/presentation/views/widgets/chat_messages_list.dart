import 'package:flutter/material.dart';
import 'package:smart_medi/features/ai_assistant/data/models/chat_message_model.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/widgets/chat_message_bubble.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    super.key,
    required this.messages,
    this.isSending = false,
  });

  final List<ChatMessageModel> messages;
  final bool isSending;

  @override
  Widget build(BuildContext context) {
    final itemCount = messages.length + (isSending ? 1 : 0);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (isSending && index == messages.length) {
            return const TypingIndicatorBubble();
          }
          return ChatMessageBubble(message: messages[index]);
        },
        childCount: itemCount,
      ),
    );
  }
}

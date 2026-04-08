import 'package:chat_demo/feature/data/model/message_model.dart';
import 'package:chat_demo/feature/presentation/widget/chat_message.dart';
import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  final List<MessageModel> messages;
  final String currentUserId;

  const UserChat({super.key, required this.messages, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];

        bool isUser=currentUserId==msg.senderId;
        return Align(
          alignment: isUser?Alignment.centerRight: Alignment.centerLeft,
          child: ChatMessage(msg: msg,)
          );
      },
    );
  }
}

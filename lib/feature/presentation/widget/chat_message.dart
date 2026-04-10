import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';
import 'chat_message/media_file.dart';
import 'chat_message/message_text.dart';
import 'chat_message/time_stamp.dart';

enum MediaType {
  image(icon: Icons.image, color: Colors.green),
  audio(icon: Icons.audio_file, color: Colors.blue),
  video(icon: Icons.videocam, color: Colors.red);

  final IconData icon;
  final Color color;

  const MediaType({required this.icon, required this.color});

  static MediaType? fromString(String? value) {
    switch (value) {
      case "image": return MediaType.image;
      case "audio": return MediaType.audio;
      case "video": return MediaType.video;
      default:      return null;
    }
  }
}

class ChatMessage extends StatelessWidget {
  final Message msg;

  const ChatMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: AppPadding.edgeAll8,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MediaFile(msg: msg),
          MessageText(message: msg.message),
          Timestamp(timestamp: msg.timestamp),
        ],
      ),
    );
  }
}
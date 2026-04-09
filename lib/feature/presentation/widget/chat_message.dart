import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:chat_demo/feature/data/model/message_model.dart';
import 'package:flutter/material.dart';

enum MediaType {
  image(icon: Icons.image, color: Colors.green),
  audio(icon: Icons.audio_file, color: Colors.blue),
  video(icon: Icons.videocam, color: Colors.red);

  final IconData icon;
  final Color color;

  const MediaType({required this.icon, required this.color});

  static MediaType? fromString(String? value) {
    switch (value) {
      case "image":
        return MediaType.image;
      case "audio":
        return MediaType.audio;
      case "video":
        return MediaType.video;
      default:
        return null;
    }
  }
}

class ChatMessage extends StatelessWidget {
  final MessageModel msg;

  const ChatMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {

    final MediaType? type = MediaType.fromString(msg.mediaType);

    return Container(
      margin: EdgeInsets.all(6),
      padding: AppPadding.edgeAll8,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (type != null && msg.mediaPath != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(type.icon, color: type.color),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    msg.mediaPath!.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

          if (msg.message.isNotEmpty)
            Text(msg.message),

          const SizedBox(height: 4),
          Text(
            msg.timestamp,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),

        ],
      ),
    );
  }
}
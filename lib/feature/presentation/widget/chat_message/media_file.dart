import 'package:flutter/cupertino.dart';
import '../../../domain/entities/message.dart';
import '../chat_message.dart';

class MediaFile extends StatelessWidget{
  final Message msg;

  const MediaFile({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    final MediaType? type = MediaType.fromString(msg.mediaType);

    if (type == null || msg.mediaPath == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
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
    );
  }
}
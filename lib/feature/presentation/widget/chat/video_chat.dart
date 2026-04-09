import 'package:flutter/material.dart';

import '../../cubit/chat_cubit.dart';
import '../../cubit/chat_state.dart';

class VideoChat extends StatelessWidget {
  final ChatLoaded state;
  final ChatCubit chatCubit;

  const VideoChat({super.key, required this.state, required this.chatCubit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.videocam, color: Colors.red),
      title: Text(
        state.selectedVideo!.path.split('/').last,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => chatCubit.clearVideo(),
      ),
    );
  }
}

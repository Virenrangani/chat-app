import 'package:flutter/material.dart';
import '../../cubit/chat_cubit.dart';
import '../../cubit/chat_state.dart';

class AudioChat extends StatelessWidget {
  final ChatLoaded state;
  final ChatCubit chatCubit;

  const AudioChat({super.key,required this.state,required this.chatCubit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.audio_file, color: Colors.blue),
      title: Text(
        state.selectedAudio!.path.split('/').last,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => chatCubit.clearAudio(),
      ),
    );
  }
}

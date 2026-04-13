import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/chat_cubit.dart';

class AudioChat extends StatefulWidget {
  const AudioChat({super.key});

  @override
  State<AudioChat> createState() => _AudioChatState();
}

class _AudioChatState extends State<AudioChat> {

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: const Icon(Icons.audio_file, color: Colors.blue),
      title: Text(
        context.read<ChatCubit>().file!.path.split('/').last,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle:IconButton(onPressed: (){
        context.read<ChatCubit>().toggleAudio();
      }, icon: Icon(context.watch<ChatCubit>().isPlaying?Icons.pause:Icons.play_arrow)),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.read<ChatCubit>().clearDocument()
      ),
    );
  }
}

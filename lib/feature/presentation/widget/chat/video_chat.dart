import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../cubit/chat_cubit.dart';

class VideoChat extends StatefulWidget {

  const VideoChat({super.key});

  @override
  State<VideoChat> createState() => _VideoChatState();
}

class _VideoChatState extends State<VideoChat> {

  @override
  void initState() {
    super.initState();
    final file = context.read<ChatCubit>().file;
    if (file != null) {
      context.read<ChatCubit>().initVideo(file);
    }
  }


  @override
  Widget build(BuildContext context) {
    final file = context.watch<ChatCubit>().file;
    final controller=context.read<ChatCubit>().videoController;
    if (file == null) return const SizedBox();

    return Stack(
      children: [
        Column(
          children: [
            controller != null && controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
                : const SizedBox(
              height: 150,
              child: Center(child: CircularProgressIndicator()),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    context.read<ChatCubit>().toggleVideo();
                    },
                  icon: Icon(
                    context.read<ChatCubit>().isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
                Text(
                  file.path.split('/').last,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        IconButton(
            icon: const Icon(Icons.close,color: Colors.white,),
            onPressed: () => context.read<ChatCubit>().clearDocument()
        ),
      ],
    );
  }
}

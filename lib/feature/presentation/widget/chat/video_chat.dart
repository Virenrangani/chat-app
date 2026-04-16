import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
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
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width:1.2,color: AppColor.secondaryDark)
              ),
              child: controller != null && controller.value.isInitialized
                  ? VideoPlayer(controller)
                  :  Center(child: CircularProgressIndicator()),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    context.read<ChatCubit>().toggleVideo();
                    },
                  icon: Icon(
                    context.watch<ChatCubit>().isVideoPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: AppColor.primarySurface,
                  ),
                ),
                Text(
                  file.path.split('/').last,
                  overflow: TextOverflow.ellipsis,
                  style:AppTextStyles.captionMedium(),
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

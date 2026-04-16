import 'dart:io';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constant/text_style/app_text_style.dart';
import '../../../../core/widget/file_duration/file_duration.dart';
import '../../cubit/chat_cubit.dart';

class VideoMediaFile extends StatefulWidget {
  final File file;
  const VideoMediaFile({super.key, required this.file});

  @override
  State<VideoMediaFile> createState() => _VideoMediaFileState();
}

class _VideoMediaFileState extends State<VideoMediaFile> {

  @override
  void initState() {
    super.initState();
    final file = widget.file;
    context.read<ChatCubit>().initVideo(file);
    }

  @override
  Widget build(BuildContext context) {
    final file = widget.file;
    final controller=context.read<ChatCubit>().videoController;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
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
                context.read<ChatCubit>().isVideoPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                color: AppColor.scaffoldBackground,
              ),
            ),
            Expanded(
              child: Text(
                file.path.split('/').last,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.titleMedium(),
              ),
            ),
            Text(formatDuration(controller?.value.duration),style: AppTextStyles.captionMedium(),)
          ],
        ),
      ],
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoMediaFile extends StatefulWidget {
  final File file;
  const VideoMediaFile({super.key, required this.file});

  @override
  State<VideoMediaFile> createState() => _VideoMediaFileState();
}

class _VideoMediaFileState extends State<VideoMediaFile> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    final file = widget.file;
    controller = VideoPlayerController.file(File(file.path))
      ..initialize().then((_) {
        setState(() {});
      });
    }

  void toggleVideo() {
    if (controller == null) return;

    if (controller!.value.isPlaying) {
      controller!.pause();
    } else {
      controller!.play();
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final file = widget.file;

    return Column(
      children: [
        controller != null && controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        )
            : const SizedBox(
          height: 150,
          child: Center(child: CircularProgressIndicator()),
        ),
        Row(
          children: [
            IconButton(
              onPressed: toggleVideo,
              icon: Icon(
                controller?.value.isPlaying ?? false
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            ),
            Expanded(
              child: Text(
                file.path.split('/').last,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

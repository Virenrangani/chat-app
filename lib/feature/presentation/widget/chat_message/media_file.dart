import 'dart:io';
import 'package:chat_demo/feature/presentation/widget/media_file/audio_image_file.dart';
import 'package:chat_demo/feature/presentation/widget/media_file/image_media_file.dart';
import 'package:chat_demo/feature/presentation/widget/media_file/video_media_file.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/message.dart';
import '../chat_message.dart';

class MediaFile extends StatelessWidget{
  final Message msg;
  const MediaFile({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    switch (MediaType.fromString(msg.mediaType)) {
      case MediaType.image:
        return ImageMediaFile(file: File(msg.mediaPath?? ""));
      case MediaType.audio:
        return AudioImageFile(file: File(msg.mediaPath?? ""),);
      case MediaType.video:
        return VideoMediaFile(file: File(msg.mediaPath?? ""),);
      case null:
        return const SizedBox.shrink();
    }
  }
}
import 'package:chat_demo/feature/presentation/widget/chat/audio_chat.dart';
import 'package:chat_demo/feature/presentation/widget/chat/image_chat.dart';
import 'package:chat_demo/feature/presentation/widget/chat/video_chat.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_cubit.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_message.dart';

class SelectMediaFile extends StatelessWidget {

  const SelectMediaFile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    switch (context.read<ChatCubit>().mediaType) {
      case MediaType.image:
        return ImageChat();
      case MediaType.audio:
        return AudioChat();
      case MediaType.video:
        return VideoChat();
      case null:
        return const SizedBox.shrink();
    }
  }
}
import 'package:chat_demo/feature/presentation/widget/chat/audio_chat.dart';
import 'package:chat_demo/feature/presentation/widget/chat/image_chat.dart';
import 'package:chat_demo/feature/presentation/widget/chat/video_chat.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_cubit.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'chat_message.dart';

class SelectMediaFile extends StatelessWidget {
  final ChatLoaded state;
  final ChatCubit chatCubit;

  const SelectMediaFile({
    super.key,
    required this.state,
    required this.chatCubit,
  });

  MediaType? get _selectedType {
    if (state.selectedImage != null) return MediaType.image;
    if (state.selectedAudio != null) return MediaType.audio;
    if (state.selectedVideo != null) return MediaType.video;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    switch (_selectedType) {
      case MediaType.image:
        return ImageChat(state: state, chatCubit: chatCubit);
      case MediaType.audio:
        return AudioChat(state: state, chatCubit: chatCubit);
      case MediaType.video:
        return VideoChat(state: state, chatCubit: chatCubit);
      case null:
        return const SizedBox.shrink();
    }
  }
}
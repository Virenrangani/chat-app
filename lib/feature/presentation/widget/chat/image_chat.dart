import 'package:chat_demo/feature/presentation/cubit/chat_cubit.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_state.dart';
import 'package:flutter/material.dart';

class ImageChat extends StatelessWidget {
  final ChatLoaded state;
  final ChatCubit chatCubit;
  const ImageChat({super.key,required this.state, required this.chatCubit,});

  @override
  Widget build(BuildContext context, ) {
    return Stack(
      children: [
        Image.file(state.selectedImage!,
            height: 180, fit: BoxFit.cover, width: double.infinity),
        Positioned(
          top: 4, right: 4,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => chatCubit.clearImage(),
          ),
        ),
      ],
    );
  }
}

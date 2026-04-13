import 'package:chat_demo/feature/presentation/cubit/chat_cubit.dart';
import 'package:chat_demo/feature/presentation/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageChat extends StatelessWidget {
  const ImageChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
            context.read<ChatCubit>().file!,
            height:200, fit: BoxFit.cover, width: double.infinity),
        Positioned(
          top: 4, right: 4,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.read<ChatCubit>().clearDocument()
          ),
        ),
      ],
    );
  }
}

import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/border_radius/app_border_radius.dart';
import '../../../core/constant/padding/app_padding.dart';

class ChatOption extends StatelessWidget {
  const ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.edgeAll16,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.verTop12,
        color: AppColor.textWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.image),
          ),

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.audio_file),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.videocam_outlined),
          ),
        ],
      ),
    );
  }
}
